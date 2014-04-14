
describe 'getting stats for a given team and year' do

  context '2009 Oakland A\'s' do
    Given(:query) {BaseballQuery.new}
    Given(:year) {2009}
    Given(:team) {'OAK'}

    When(:result) {query.get_statistics_by_team(team,year)}

    Then { expect(result.all? {|stat| stat.teamId == 'OAK'}).to eq(true)}
    Then { expect(result.all? {|stat| stat.year == 2009}).to eq(true)}
    end

end