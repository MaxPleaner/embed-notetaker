class Event
	def self.sources
		[	
			{ name: "Funcheap SF", key: "funcheap" },
			{ name: "Meetup", key: "meetup" },
			{ name: "SF List", key: "list" },
			{ name: "Indybay", key: "indybay" },
			# { name: "Noisebridge", key: "noisebridge" },
		]
	end
	def self.source(source_key)
		source_key.capitalize.constantize.new
	end
	attr_reader :content
	def initialize(content)
		@content = content
	end
end