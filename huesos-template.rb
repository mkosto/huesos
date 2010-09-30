#
# Huesos template
#

# Delete dummy files
run "rm public/index.html"
run "rm public/images/rails.png"
run "rm public/favicon.ico"
run "echo > README"

# Generate default controller, download plugins, etc...
generate :controller, "inicio index"
route "map.root :controller => 'inicio'"

plugin "high_voltage", :git => "git://github.com/idsign/high_voltage.git"
plugin "jrails", :git => "git://github.com/aaronchi/jrails.git"
rake 'jrails:js:scrub'

capify!

if yes?("Are you sure you want to generate huesos? (y/n)")
  # Copy huesos template
  generate :huesos, "--force"
  
  if yes?('Do you want to run `sudo rake gems:install`? (y/n)')
    rake('gems:install', :sudo => true)
  end
  
  environment 'Hirb.enable', :env => 'development'
end


# Git
git :init

file ".gitignore", <<-END
.DS_Store
db/*.sqlite3
log/*.log
tmp/**/*
config/database.yml
config/deploy.rb
*.tmproj
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => "."
git :commit => "-m 'Initial commit using Huesos'"
