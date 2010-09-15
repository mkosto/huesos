namespace :tmp do
  namespace :assets do 
    desc "Delete all.js and all.css cache files"
    task :delete_cache => :environment do
      puts FileUtils.rm(Dir['public/{stylesheets,javascripts}/all.*'])
    end
  end
end
