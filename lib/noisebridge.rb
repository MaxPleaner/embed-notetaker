class Noisebridge
	attr_reader :page_text
	def initialize
		url = "http://www.noisebridge.net/wiki/category:events"
		@page_text = Net::HTTP.get(URI(url))
	end
	def events(params={})
		page = Nokogiri.parse(page_text)
		days = [
			"Wednesdays", "Thursdays", "Fridays",
			"Saturdays", "Sundays", "Mondays", "Tuesdays", 
		]
		today = Time.now
		today_idx = today.day
		ordered_days = days[today_idx..-1] + days[0...today_idx].uniq
		binding.pry
		results = ordered_days.map do |day|
			{
				day: today + ordered_days.index(day),
				content: page
			}
		end
	end
end