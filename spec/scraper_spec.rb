require 'spec_helper'
require 'fetch'
require 'output'
require 'run'
require 'scraper'

RSpec.describe Scraper do
  it 'returns a hash when #data is called' do
    scraper = Scraper.new
    expect(scraper.data).not_to be_empty
  end
end

RSpec.describe Output do
  it 'organises the data for easy presentation' do
    output = Output
    data = [
      {category: 'Cricket', title: 'England lead Ireland by 181 - in-play clips, radio & text'},
      {category: 'Cricket', title: '\'Dad didn\'t come because it was too hot\' - Leach \'can\'t believe\' his nightwatchman innings'},
      {category: 'Football', title: 'Big brother & immediate impact - Ndombele\'s Spurs scouting report'}
    ]
    expected = {
      'Cricket' => ['England lead Ireland by 181 - in-play clips, radio & text',
                    '\'Dad didn\'t come because it was too hot\' - Leach \'can\'t believe\' his nightwatchman innings'],
      'Football' => ['Big brother & immediate impact - Ndombele\'s Spurs scouting report']
    }
    organised = output.new.send(:organise, data)
    expect(organised).to be(organised)
  end
end
