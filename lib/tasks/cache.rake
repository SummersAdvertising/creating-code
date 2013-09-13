namespace :cache do
  desc "clear memory cache"
  task :clear => :environment do
  
  	Rails.cache.clear
  
  end

end
