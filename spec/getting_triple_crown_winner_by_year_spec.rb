require 'rspec/given'

describe 'getting triple crown winners by league for 2012' do

  context 'the 2012 baseball season' do
    Given(:query) {BaseballQuery.new}
    Given(:year) {2012}

    When(:result) {query.GetTripleCrownWinnerByYear(year)}

    Then { expect(result.find {|winner| winner[:league] == 'AL'}[:winner]).to eq('Miguel Cabrera')}
    Then { expect(result.find {|winner| winner[:league] == 'NL'}[:winner]).to eq('no one')}
    end

  context 'the 2011 baseball season' do
    Given(:query) {BaseballQuery.new}
    Given(:year) {2011}

    When(:result) {query.GetTripleCrownWinnerByYear(year)}

    Then { expect(result.find {|winner| winner[:league] == 'AL'}[:winner]).to eq('no one')}
    Then { expect(result.find {|winner| winner[:league] == 'NL'}[:winner]).to eq('no one')}
    end

end