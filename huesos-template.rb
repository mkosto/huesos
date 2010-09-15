# Huesos template
run "rm public/index.html"
run "echo > README"

if yes?("Do you want to run gems:install? (y/n)")
  rake('gems:install', :sudo => true)
end

# Generate
generate :controller, "inicio index"
route "map.root :controller => 'inicio'"

plugin "high_voltage", :git => "git://github.com/idsign/high_voltage.git"
plugin "more", :git => "git://github.com/idsign/more.git"
plugin "jrails", :git => "git://github.com/aaronchi/jrails.git"

environment 'Hirb.enable', :env => 'development'
environment 'AppConfig[:google_analytics_account_id] = ""', :env => 'production'

capify!

generate :huesos


# Git
git :init

file ".gitignore", <<-END
.DS_Store
db/*.sqlite3
log/*.log
tmp/**/*
config/database.yml
config/deploy.rb
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => "."
git :commit => "-m 'Initial commit using Huesos'"
