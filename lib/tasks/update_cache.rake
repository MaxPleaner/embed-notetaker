task :update_cache => :environment do
	Item.all.each(&:update_cache)
end