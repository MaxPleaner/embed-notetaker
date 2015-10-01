class Indybay
	attr_reader :xml_doc
	def initialize
		url = "http://www.indybay.org/syn/generate_rss.php?include_posts=1&include_attachments=0&include_events=1"
		@xml_doc = Nokogiri.parse(open(url))
	end
	def events(params={})
		groups = xml_doc.css("item").reduce({}) do |results, item|
			date = DateTime.strptime(item.css("date")[0].text, "%Y-%m-%dT%H:%M")
			date_key = date.strftime("%A, %b %d")
			time_of_day = nil #date.strftime("%l:%M %P")
			
			img = item.try(:css, "enclosure")
			img = img.to_a.empty? ? nil : img.try(:attr, "url").try(:first).try(:text)

			title = item.try(:css, "title")
			title = title.to_a.empty? ? nil : title.try(:first).try(:text)
			
			creator = item.try(:css, "creator")
			creator = creator.to_a.empty? ? nil : creator.try(:first).try(:text)
			
			link = nil #item.try(:css, "link").try(:first).try(:text)
			
			desc = item.try(:css, "description")
			desc = desc.to_a.empty? ? nil : desc.try(:first).try(:text)

			results[date_key] ||= []
			results[date_key] << <<-TXT
				#{("<b>" + title + "</b><br>") if title}
				#{("<a href='" + link + "'>link</a><br>") if link}
				#{("<p>" + time_of_day + "</p>") if time_of_day}
				#{("<p>" + creator + "</p>") if creator}
				#{("<i>" + desc + "</i><br>") if desc}
				#{("<img src='" + img + "'>") if img}
			TXT
			results
		end
		groups
			.reduce([]) do |arr, (date, content)|
				arr << {
					name: date,
					content: content.join("<hr>").html_safe
				}; arr
			end.reverse
	end
end