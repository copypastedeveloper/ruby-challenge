require_relative 'BaseballQuery'

class PlayerYearlyStatistics

  attr_reader :playerId,:year,:league,:teamId,:games,:atBats,:runs,:rbi,:homeRuns,:triples,:hits,:doubles, :name

  def initialize(playerId,yearId,league,teamId,games,atBats,runs,hits,doubles,triples,homeRuns,rbi,sb,cs,name)
    @playerId = playerId
    @year = yearId.to_i
    @league = league
    @teamId = teamId
    @games = games.to_i
    @atBats = atBats.to_f
    @runs = runs.to_i
    @rbi = rbi.to_i
    @homeRuns = homeRuns.to_i
    @triples = triples.to_f
    @hits = hits.to_f
    @doubles = doubles.to_f
    @name = name
  end

  def BattingAverage
    @battingAverage ||= @atBats != 0 ? hits/atBats : 0
  end

  def SluggingPercentage
    if (defined?(@sluggingPercentage)).nil?
      if @atBats == 0
        return @sluggingPercentage = 0
      end

      bases = ((@hits - @doubles - @triples - @homeRuns) + (2 * @doubles) + (3 * @triples) + (4 * @homeRuns))
      @sluggingPercentage = bases / @atBats
    end

    @sluggingPercentage
  end

end
