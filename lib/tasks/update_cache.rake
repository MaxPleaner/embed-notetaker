task :update_cache => :environment do
	Note.all.each(&:update_cache)
end