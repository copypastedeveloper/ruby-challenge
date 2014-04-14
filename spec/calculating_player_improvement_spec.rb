
describe 'calculating improvement' do

  context '2009 through 2010' do
    Given(:query) {BaseballQuery.new}
    Given(:startingYear) {2009}
    Given(:endingYear) {2010}

    When(:result) {query.get_most_improved_player_for_years(startingYear,endingYear)}

    Then { expect(result[:player]).to eq('Aaron Hill')}
    Then { expect(result[:improvement]).to eq(0.08137829912023462)}
    end

end