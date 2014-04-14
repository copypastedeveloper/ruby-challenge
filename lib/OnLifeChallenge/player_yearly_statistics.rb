require_relative 'BaseballQuery'

class PlayerYearlyStatistics

  attr_reader :playerId,:year,:league,:teamId,:games,:at_bats,:runs,:rbi,:home_runs,:triples,:hits,:doubles, :name

  def initialize(playerId,yearId,league,teamId,games,at_bats,runs,hits,doubles,triples,home_runs,rbi,sb,cs,name)
    @playerId = playerId
    @year = yearId.to_i
    @league = league
    @teamId = teamId
    @games = games.to_i
    @at_bats = at_bats.to_f
    @runs = runs.to_i
    @rbi = rbi.to_i
    @home_runs = home_runs.to_i
    @triples = triples.to_f
    @hits = hits.to_f
    @doubles = doubles.to_f
    @name = name
  end

  def batting_average
    @battingAverage ||= @at_bats != 0 ? hits/at_bats : 0
  end

  def slugging_percentage
    if (defined?(@sluggingPercentage)).nil?
      if @at_bats == 0
        return @sluggingPercentage = 0
      end

      bases = ((@hits - @doubles - @triples - @home_runs) + (2 * @doubles) + (3 * @triples) + (4 * @home_runs))
      @sluggingPercentage = bases / @at_bats
    end

    @sluggingPercentage
  end

end
