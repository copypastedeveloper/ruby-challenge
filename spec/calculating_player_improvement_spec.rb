
describe 'calculating improvement' do

  context '2009 through 2010' do
    Given(:query) {BaseballQuery.new}
    Given(:startingYear) {2009}
    Given(:endingYear) {2010}

    When(:result) {query.GetMostImprovedPlayerForYears(startingYear,endingYear)}

    Then { expect(result[:playerId]).to eq('hillaa01')}
    end

end