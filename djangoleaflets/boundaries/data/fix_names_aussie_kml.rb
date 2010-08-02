#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'

f = File.open('COM_ELB_20090828.kml')
doc = Nokogiri::XML(f)
f.close

doc.search('Placemark').each do |placemark|
    description_html = placemark.at('description').inner_text
    description_doc = Nokogiri::HTML(description_html)
    # Extract the actual electorate name from the html table that's hidden in the description. Yeah, cool.
    name_value = description_doc.search('table tr').find {|t| t.at('td').inner_text == "Elect_div"}.search('td')[1].inner_text
    name_tag = placemark.at('name')
    name_tag.content = name_value
end

File.open('australia.kml', 'w') do |f|
    f << doc
end




