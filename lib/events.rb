class Events
	def self.event_url(short_name)
		"/events/#{short_name}"
	end
	def self.sources
		{
			"Funcheap SF" => event_url("funcheap"),
			"Meetup" => event_url("meetup"),
			"SF List" => event_url("list"),
			"Indybay" => event_url("indybay"),
		}
	end
end