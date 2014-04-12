require_relative 'BaseballQuery'

class PlayerYearlyStatistics

  attr_reader :playerId,:year,:league,:teamId,:games,:atBats,:runs,:rbi,:homeRuns,:triples,:hits,:doubles, :name

  def initialize(playerId,yearId,league,teamId,games,atBats,runs,hits,doubles,triples,homeRuns,rbi,sb,cs,name)
    @playerId = playerId
    @year = yearId.to_i
    @league = league
    @teamId = teamId
    @games = games.to_f
    @atBats = atBats.to_f
    @runs = runs.to_f
    @rbi = rbi.to_f
    @homeRuns = homeRuns.to_f
    @triples = triples.to_f
    @hits = hits.to_f
    @doubles = doubles.to_f
    @name = name
  end

  def BattingAverage
    if @atBats == 0
      return 0
    end

    hits/atBats
  end

  def SluggingPercentage
    bases = ((@hits - @doubles - @triples - @homeRuns) + (2 * @doubles) + (3 * @triples) + (4 * @homeRuns))
    bases / @atBats
  end

end
