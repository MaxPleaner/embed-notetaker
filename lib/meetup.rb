class Meetup
	attr_reader :client, :defaults
	def initialize
    @client = MeetupApi.new
    @defaults = {
    	category: client
    		.categories({})['results']
    		.map { |r| r["id"] }.join(","),
      city: 'San Francisco',
      state: "CA",
      country: 'US',
      status: 'upcoming',
      format: 'json',
      page: '50'
    }
	end
	def events(params)
		events = client.open_events(@defaults.merge(params))['results']
		events.map do |event|
			{
				name: event["name"],
				content: ["description", "venue", "event_url", "time" ].map { |attr|
					"#{attr}: #{event[attr]}"
				}.join("\n\n").html_safe
			}
		end
	end
end