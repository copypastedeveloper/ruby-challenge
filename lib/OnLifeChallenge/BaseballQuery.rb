require_relative 'BaseballStatsProvider'

class BaseballQuery

  def GetMostImprovedPlayerForYears(startYear, endYear)

    statistics
      .select {|row| (row.year == startYear || row.year == endYear) && row.atBats > 200}
      .group_by {|row| row.playerId}
      .select{|_,stats| stats.count == 2} #only want players that played both years
      .map {|_,stats| {:player=> stats[1].name, :improvement => stats[1].BattingAverage - stats[0].BattingAverage}}
      .sort_by {|playerData| playerData[:improvement].to_f}
      .reverse!
      .first

  end

  def GetStatisticsByTeam(team,year)
      statistics.select {|row| row.teamId == team.upcase && row.year == year}
  end

  def GetTripleCrownWinnerByYear(year)
    statsByLeague = statistics
      .select { |row| row.year == year && row.atBats > 400 }
      .group_by { |row| row.league }
      .map { |league, stats| {:league => league, :winner => tripleCrownWinner(stats)}}
  end

private
    def statistics
      BaseballStatsProvider.Stats
    end

    def tripleCrownWinner(stats)
      bestBattingAverage = stats.max_by{|stat| stat.BattingAverage}
      mostRbi = stats.max_by{|stat| stat.rbi}
      mostHomeRuns = stats.max_by{|stat| stat.homeRuns}

      if bestBattingAverage == mostRbi && mostRbi == mostHomeRuns
        bestBattingAverage.name
      else
        'no one'
      end

    end
end