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
      page: '1000',
      time: "0,5d"
    }
	end
	def events(params={})
		listings = client.open_events(@defaults.merge(params))['results']
		results = listings.reduce({}) do |results, listing|
			time = Time
				.at(listing['time'].to_i / 1000)
			time_key = time.strftime("%A, %B %d, %Y")
			listing['time'] = time.strftime("%l:%M %P")
			results[time_key] ||= []
			results[time_key] << listing
			results
		end
		results.reduce([]) do |arr, (time, entries)|
			arr << {
				name: time,
				content: entries.map { |entry| 
					text = ["description", "venue", "event_url", "time" ].map { |attr|
					"#{entry[attr]}"
					}.join("\n\n")
					Embed.toggler(
						title: "#{entry['time']} - #{entry['group']['who']}",
						content: text
					)
				}.join("\n\n\n\n")
			}; arr
		end
	end
end