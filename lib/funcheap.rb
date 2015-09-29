# class Funcheap
# 	attr_reader :events_text
# 	def initialize
# 		@url = "http://sf.funcheap.com/events/"
# 		@events_text = `curl #{@url} | w3m -dump -T text/html`
# 	end
# 	def events
# 		# dates = @event_text.scan
# 		[@events_text]
# 	end
# end