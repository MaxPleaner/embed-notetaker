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
			begin
				cached_text = ERB.new(content).result
			rescue SyntaxError => e
				cached_text = "There was an error with the Note's ERB.  <a href='/notes/#{id}/edit'>Edit the note</a>"
			end
			update(cached_content: cached_text)
		end
		cached_text
	end
end
