require 'csv'
require_relative 'player_yearly_statistics'

class BaseballStatsProvider

  def BaseballStatsProvider.Stats
    if (defined?(@@stats)).nil?
      @@stats = []
      battingArray = CSV.read(File.new(__dir__+'/Batting-07-12.csv'))
      battingArray.shift

      nameArray = CSV.read(File.new(__dir__+'/Master-small.csv'))
      nameArray.shift
      names = Hash[nameArray.map {|row| [row[0],"#{row[2]} #{row[3]}"]}]

      battingArray.each {|row| @@stats.push PlayerYearlyStatistics.new(*row,names[row[0]])}
    end
    return @@stats
  end
end