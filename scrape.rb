# needed to run:
# brew install selenium-server-standalone

require "selenium-webdriver"
require 'csv'

profile = Selenium::WebDriver::Firefox::Profile.new
profile.add_extension("/Users/gabrieldance/Library/Application Support/Firefox/Profiles/jmkjynsm.default/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi")


CSV.foreach("portfolio.csv",:headers=>true) do |row|
	puts row["url"]
	driver = Selenium::WebDriver.for(:firefox,:profile=>profile)
	driver.navigate.to(row["url"])

	sleep(15)
	
	save_name="screenshots/"+row["date"]+".png"
	driver.save_screenshot(save_name)

	driver.quit
end