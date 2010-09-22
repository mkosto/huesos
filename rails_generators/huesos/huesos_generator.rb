require File.expand_path(File.dirname(__FILE__) + "/lib/insert_commands.rb")
class HuesosGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @project_name = @args.first || 'Huesos'
  end

  def manifest
    record do |m|
      m.directory 'app/helpers'
      m.directory 'app/stylesheets'
      m.directory 'app/views/layouts'
      m.directory 'app/views/shared'

      m.directory 'config/locales'
      m.directory 'lib/tasks'

      m.directory 'public/images'
      m.directory 'public/javascripts'
      m.directory 'public/resources'
      m.directory 'public/stylesheets/hacks'

      # Helpers
      m.file "app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"

      # Stylesheets
      %w( _960_grid _layout _makeup _shared application base inicio ).each do |file|
        m.file "app/stylesheets/#{file}.less", "app/stylesheets/#{file}.less"
      end

      # Views
      %w( _main_nav _menu _top_bar ).each do |file|
        m.file "app/views/layouts/#{file}.html.erb", "app/views/layouts/#{file}.html.erb"
      end
      %w( application _footer).each do |file|
        m.template "app/views/layouts/#{file}.html.erb", "app/views/layouts/#{file}.html.erb"
      end
      m.file "app/views/shared/_common_actions.html.erb", "app/views/shared/_common_actions.html.erb"

      # Config
      m.file "config/database.yml", "config/database.yml"
      m.file "config/deploy.rb", "config/deploy.rb"
      m.file "config/environment.rb", "config/environment.rb"
      m.file "config/locales/es_MX.yml", "config/locales/es_MX.yml"

      # Lib and Tasks
      m.file "lib/tasks/delete_cache.rake", "lib/tasks/delete_cache.rake"

      # Public
      m.file "public/favicon.ico", "public/favicon.ico"
      %w( grid.png huesos_logo.png transparent.gif wrapper_bg.gif ).each do |file|
        m.file "public/images/#{file}", "public/images/#{file}"
      end
      m.file "public/javascripts/cufon-yui.js", "public/javascripts/cufon-yui.js"
      m.file "public/stylesheets/hacks/ie6.css", "public/stylesheets/hacks/ie6.css"

      m.insert_into "app/controllers/application_controller.rb",
        "class ApplicationController < ActionController::Base", "  include MetadataExtractor"

    end
  end

  def project_name
    @project_name
  end

end
