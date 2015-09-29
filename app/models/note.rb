class Note < ActiveRecord::Base
	def update_cache
		update(cached_content: nil)
		cached_content
	end
	def cached_content
		cached_text = super
		if cached_text
			cached_text
		else
			cached_text = ERB.new(content).result
			update(cached_content: cached_text)
		end
		cached_text
	end
end
