require_relative 'BaseballStatsProvider'

class BaseballQuery

  def GetMostImprovedPlayerForYears(startYear, endYear)

    statistics
      .select {|row| (row.year == startYear || row.year == endYear) && row.atBats > 200}
      .group_by {|row| row.playerId}
      .select{|_,stats| stats.count == 2} #only want players that played both years
      .map {|player,stats| {:playerId => player, :improvement => stats[1].BattingAverage stats[0].BattingAverage}}
      .sort_by {|playerData| playerData[:improvement].to_f}
      .reverse!
      .first

  end

  def GetStatisticsByTeam(teamId,year)
      statistics.select {|row| row.teamId == teamId.upcase && row.year == year}
  end

  def statistics
    BaseballStatsProvider.Stats
  end
end