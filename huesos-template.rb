# Huesos template
should_generate_huesos = yes?("Are you sure you want to generate huesos? (y/n)")

run "rm public/index.html"
run "rm public/images/rails.png"
run "rm public/favicon.ico"
run "rm public/javascripts/{controls,dragdrop,effects,prototype}.js"
run "echo > README"

generate :controller, "inicio index"
route "map.root :controller => 'inicio'"
plugin "high_voltage", :git => "git://github.com/idsign/high_voltage.git"
capify!

generate :huesos, "--force" if should_generate_huesos

# Git
git :init

file ".gitignore", <<-END
.DS_Store
db/*.sqlite3
log/*.log
tmp/**/*
config/database.yml
config/deploy/*
*.tmproj
.idea/
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => "."
git :commit => "-m 'Initial commit using Huesos'"
