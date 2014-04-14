require_relative 'OnLifeChallenge/version'
require_relative 'OnLifeChallenge/BaseballQuery'

class OnLifeChallengeHelper

  def initialize
    @baseballQuery = BaseballQuery.new
  end

  def PrintMostImprovedPlayer(startYear,endYear)
    @result = @baseballQuery.get_most_improved_player_for_years(startYear,endYear)
    puts "#{@result[:player]} improved by #{@result[:improvement]} between #{startYear} and #{endYear}"
  end

  def PrintSluggingPercentageForOakland(year)
    @result = @baseballQuery.get_statistics_by_team('oak',year).map {|stat| "#{stat.name} had a slugging percentage of  #{stat.slugging_percentage } for #{year}" }
    puts @result
  end

  def PrintTripleCrownWinner(year)
    @baseballQuery.get_triple_crown_winner_by_year(year).each do |result|
      puts "#{result[:league]} winner for #{year} was #{result[:winner]}"
    end
  end

end

challenge = OnLifeChallengeHelper.new
challenge.PrintSluggingPercentageForOakland(2007)
challenge.PrintMostImprovedPlayer(2009,2010)
challenge.PrintTripleCrownWinner(2011)
challenge.PrintTripleCrownWinner(2012)