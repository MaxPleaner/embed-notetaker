class Funcheap
	attr_reader :events_text
	def initialize
		@url = "http://sf.funcheap.com/events/"
		@events_text = `curl #{@url} | w3m -dump -T text/html`
	end
	def events(params={})
			dates = @events_text
				.split
				.each_cons(4)
				.map { |a| a.join(' ') }
				.select { |s| Date.strptime(s, "%A, %B %d, %Y") rescue nil }
			dates_regex = /(?=#{ dates.join("|") })/i
			events = @events_text.split(dates_regex).map do |str|
				if dates.include?(str) || str.match(/Want to narrow/)
					""
				else
					str.split("»Last »")[0]
				end
			end.reject(&:empty?)
			dates.reduce([]) do |results, date|
				results << {
					name: date,
					content: "<pre>#{events[results.length]}</pre>".html_safe
				}; results
			end
	end
end