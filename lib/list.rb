class List
	attr_reader :text
	def initialize
		url = "http://www.foopee.com/punk/the-list/by-date.0.html"
		@text = `curl #{url} | w3m -dump -T text/html`
	end
	def events(params={})
		dates = @text
			.split
			.each_cons(3)
			.map { |a| a.join(' ') }
			.select { |s| Date.strptime(s, "%a %b %d") rescue nil }
		dates_regex = /(#{ dates.join("|") })/i
		events = @text.split(dates_regex).map do |str|
			if str.remove(/[•\s]+/).empty?
				""
			elsif dates.include?(str)
				""
			elsif str.match(/Listing By Date/)
				""
			else
				str.split(/━+/)[0]
			end
		end.reject(&:empty?)
		dates.reduce([]) do |arr, date|
			arr << {
				name: date,
				content: "<pre>#{events[arr.length].html_safe}</pre>"
					.split("□")
					.join("\n")
			}; arr
		end
	end
end