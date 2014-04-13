require 'OnLifeChallenge/version'
require 'OnLifeChallenge/BaseballQuery'

class OnLifeChallengeHelper

  def initialize
    @baseballQuery = BaseballQuery.new
  end

  def GetMostImprovedPlayer(startYear,endYear)
    @result = @baseballQuery.GetMostImprovedPlayerForYears(startYear,endYear)
    puts "#{@result[:player]} improved by #{@result[:improvement]} between #{startYear} and #{endYear}"
  end

  def GetSluggingPercentageForOakland(year)
    @result = @baseballQuery.GetStatisticsByTeam('oak',year).map {|stat| {"player name" => stat.name, "Slugging percentage" => stat.SluggingPercentage } }
    puts @result
  end

end

challenge = OnLifeChallengeHelper.new
challenge.GetSluggingPercentageForOakland(2007)
challenge.GetMostImprovedPlayer(2009,2010)