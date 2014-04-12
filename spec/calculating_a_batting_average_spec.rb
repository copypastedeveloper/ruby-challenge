require 'rspec/given'
require_relative '../lib/player_yearly_statistics'

describe 'calculating batting averages' do

  def GetStatistics (hits,atBats)
    return PlayerYearlyStatistics.new('player1','2009','NL','OAK','100',atBats,'5',hits,'10','10','10','10','','','player1')
  end

  context '20 hits in 20 at bats' do
    Given(:playerStats) {GetStatistics( '20','20')}

    When(:result) {playerStats.BattingAverage}

    Then {expect(result).to eq(1)}
  end

  context '0 hits in 20 at bats' do
    Given(:playerStats) {GetStatistics( '0','20')}

    When(:result) {playerStats.BattingAverage}

    Then {expect(result).to eq(0)}
  end

  context '10 hits in 20 at bats' do
    Given(:playerStats) {GetStatistics( '10','20')}

    When(:result) {playerStats.BattingAverage}

    Then {expect(result).to eq(0.5)}
  end

  context 'nil hits in 20 at bats' do
    Given(:playerStats) {GetStatistics nil, '20' }

    When(:result) {playerStats.BattingAverage}

    Then {expect(result).to eq(0)}
  end

  context '20 hits in nil at bats' do
    Given(:playerStats) {GetStatistics('20', nil)}

    When(:result) {playerStats.BattingAverage}

    Then {expect(result).to eq(0)}
  end

  context 'nil hits in nil at bats' do
    Given(:playerStats) {GetStatistics( nil, nil)}

    When(:result) {playerStats.BattingAverage}

    Then {expect(result).to eq(0)}
  end
end