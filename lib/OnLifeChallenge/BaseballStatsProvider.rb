require 'csv'
require_relative 'player_yearly_statistics'

class BaseballStatsProvider

  def self.stats
    if (defined?(@@stats)).nil?
      @@stats = []
      batting_array = CSV.read(File.new(__dir__+'/Batting-07-12.csv'))
      batting_array.shift

      names = player_name_hash

      batting_array.each {|row| @@stats.push PlayerYearlyStatistics.new(*row,names[row[0]])}
    end
    return @@stats
  end

private
    def self.player_name_hash
      name_array = CSV.read(File.new(__dir__+'/Master-small.csv'))
      name_array.shift
      Hash[name_array.map { |row| [row[0], "#{row[2]} #{row[3]}"] }]
    end
end