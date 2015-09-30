class Embed
	def self.get(url)
		Page.new(open(url).read)
	end
	def self.toggler(options)
		content = options[:content]
		title = options[:title]
		target_name = options[:target_name] || SecureRandom.urlsafe_base64.to_s
		toggling_section = <<-HTML
				<button class="toggling" target="#{target_name}">#{title}</button>
				<section id="#{target_name}" class="content" >#{content}</section>
			HTML
		toggling_section.html_safe
	end
	class Page
		def initialize(content)
			@content = Nokogiri.parse(content)
		end
		def parse(options)
			content = @content.css(options[:css]).to_s
			title = options[:title]
			target_name = title.split.join("-")
			Embed.toggler(
				content: content,
				title: title,
				target_name: target_name
			).html_safe
		end
	end
end
