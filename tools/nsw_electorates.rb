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
  url_id = a.inner_text.downcase.split(' ').join('_')
  electorate = initial_caps(a.inner_text)

  puts "INSERT INTO constituency (name,constituency_type_id,area_code,url_id) VALUES ('#{electorate}',5,'NSW','#{url_id}');"
end
