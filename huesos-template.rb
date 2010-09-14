# Huesos template
run "rm public/index.html"
run "echo > README"

gem "snailmail"
gem "RedCloth"

gem "hirb"
gem "faker"
gem "acts_as_list"
gem "awesome_nested_set"
gem "shoulda"
gem "acts-as-taggable-on"
gem "app_config"
gem "formtastic"
gem "validation_reflection"
gem "attribute_normalizer"


if yes?("Do you want to run gems:install? (y/n)")
  rake('gems:install', :sudo => true)
end

# Generate
generate :controller, "inicio index"
route "map.root :controller => 'inicio'"
plugin "high_voltage", :git => "git://github.com/idsign/high_voltage.git"
generate :huesos

# capify!


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
