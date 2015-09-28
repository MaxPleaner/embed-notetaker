require 'open-uri' 
class Embed
	def self.get(url)
		Page.new(open(url).read)
	end
	class Page
		def initialize(content)
			@content = Nokogiri.parse(content)
		end
		def parse(options)
			content = @content.css(options[:css]).to_s
			title = options[:title]
			target_name = title.split.join("-")
			toggling_section = <<-HTML
				<button class="toggling-button" target="#{target_name}">#{title}</button>
				<section id="#{target_name}">#{content}</section>
			HTML
			toggling_section.html_safe
		end
	end
end
