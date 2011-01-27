require 'rubygems'
require 'mechanize'

url = 'http://www.elections.nsw.gov.au/about_elections/electoral_boundaries/state_district_index'
agent = Mechanize.new

def initial_caps(electorate)
  electorate.split(' ').map do |e|
    e.capitalize
  end.join(' ')
end

page = agent.get(url)
page = page.at('table')

page.search('a').each do |a|
  # Get the electorate name and initial caps it
  # FIXME: If this is empty we should skip this
  electorate = initial_caps(a.inner_text)

  # Get the postcodes from each electorate page and save the data
  electorate_page = agent.get(a.attributes['href'].value)
  electorate_page.search('h3')[2].next.next.inner_text.strip.split(', ').each do |p|
    puts electorate + ', ' + p.split('.')[0]
  end
end
