require_relative 'BaseballStatsProvider'

class BaseballQuery

  def get_most_improved_player_for_years(startYear, endYear)
    statistics
      .select {|row| (row.year == startYear || row.year == endYear) && row.at_bats > 200}
      .group_by {|row| row.playerId}
      .select{|_,stats| stats.count == 2} #only want players that played both years
      .map {|_,stats| {:player=> stats[1].name, :improvement => stats[1].batting_average - stats[0].batting_average}}
      .sort_by {|playerData| playerData[:improvement].to_f}
      .reverse!
      .first
  end

  def get_statistics_by_team(team, year)
      statistics.select {|row| row.teamId == team.upcase && row.year == year}
  end

  def get_triple_crown_winner_by_year(year)
    statistics
      .select { |row| row.year == year && row.at_bats > 400 }
      .group_by { |row| row.league }
      .map { |league, stats| {:league => league, :winner => triple_crown_winner(stats)}}
  end

private
    def statistics
      BaseballStatsProvider.stats
    end

    def triple_crown_winner(stats)
      best_batting_average = stats.max_by{|stat| stat.batting_average}
      most_rbi = stats.max_by{|stat| stat.rbi}
      most_home_runs = stats.max_by{|stat| stat.home_runs}

      if best_batting_average == most_rbi && most_rbi == most_home_runs
        best_batting_average.name
      else
        'no one'
      end

    end
end