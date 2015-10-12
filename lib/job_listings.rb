class JobListings
	def self.sources
		["indeed", "stack_overflow", "jobberwocky"]
	end
	def self.indeed(start=0)
		`ruby ~/Desktop/code/scripts/find_job_listings/find_job_listings.rb source=Indeed_API start=#{start}`
	end
	def self.stack_overflow(start=0)
		`ruby ~/Desktop/code/scripts/find_job_listings/find_job_listings.rb source=StackOverflow_API start=#{start}`
	end
	def self.jobberwocky(start=0)
		`ruby ~/Desktop/code/scripts/find_job_listings/find_job_listings.rb source=Jobberwocky_API start=#{start}`
	end
end
