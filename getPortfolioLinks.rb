require 'csv'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://localhost/portfolioScreenshots/delicious.html'))

all_bookmarks=doc.css('a')
all_notes=doc.css('dd')

portfolio_links=[]
all_bookmarks.each do |bookmark|
	tags=bookmark['tags']
	split_tags=tags.split(',')
	if(split_tags.include?('portfolio'))
		portfolio_links.push(bookmark)
	end
end

puts portfolio_links.length

portfolio_csv=CSV.open("portfolio.csv", "w")
portfolio_csv << ["title","url","tags","date"]

portfolio_links.each do |link|
	# puts(link.text)
	portfolio_csv << [link.text,link['href'],link['tags'],link['add_date']]
end

