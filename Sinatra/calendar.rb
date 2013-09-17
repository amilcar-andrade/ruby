require 'rubygems'
require 'rest-client'
require 'json'

str = RestClient.get 'https://www.google.com/calendar/feeds/le55umhdasdcsmglohq2ihltfc%40group.calendar.google.com/public/basic?alt=json&orderby=starttime&sortorder=ascending'
h = JSON.parse(str)
h['feed']['entry'].each do |entry|
  puts entry['title']['$t']
end
