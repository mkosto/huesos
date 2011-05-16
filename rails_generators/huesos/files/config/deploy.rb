require File.join(File.dirname(__FILE__), 'capistrano_database_yml')
load File.join(File.dirname(__FILE__), 'deploy', 'credentials')

set :rails_env, "production"

set :application, "huesos"
set :domain, "example.com"
set :user, ""
set :password, ""
set :deploy_to, "/var/www/vhosts/#{domain}"
set :keep_releases, 4

set :scm, :git
set :repository,  "git@github.com:#{user}/#{application}.git"
set :branch, "master"
set :scm_password, ""
set :use_sudo, false
set :deploy_via, :remote_cache

role :web, domain                     # Your HTTP server, Apache/etc
role :app, domain                     # This may be the same as your `Web` server
role :db,  domain, :primary => true   # This is where Rails migrations will run

default_run_options[:pty] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :delete_cache do
    run "cd #{current_path}; rake tmp:assets:delete_cache RAILS_ENV=production"
  end
end

after "deploy", "deploy:cleanup", "deploy:delete_cache"

task :show_log, :roles => :app do
  stream "tail -f #{shared_path}/log/#{rails_env}.log"
end
