class HuesosGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @project_name = 'Huesos'
  end
  
  def manifest
    record do |m|
      m.directory 'app/helpers'
      m.directory 'app/stylesheets'
      m.directory 'app/views/layouts'
      m.directory 'config/locales'
      m.directory 'lib/tasks'
      
      # Helpers
      m.file "app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"
      
      # Stylesheets
      m.file "app/stylesheets/_layout.less", "app/stylesheets/_layout.less"
      m.file "app/stylesheets/_variables_and_mixins.less", "app/stylesheets/_variables_and_mixins.less"
      m.file "app/stylesheets/application.less", "app/stylesheets/application.less"
      m.file "app/stylesheets/base.less", "app/stylesheets/base.less"
      m.file "app/stylesheets/inicio.less", "app/stylesheets/inicio.less"
      
      # Views
      m.template "app/views/layouts/application.html.erb", "app/views/layouts/application.html.erb"
      m.file "app/views/layouts/_footer.html.erb", "app/views/layouts/_footer.html.erb"
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
      
    end
  end
  
  def project_name
    @project_name
  end

  protected

    # def add_options!(opt)
    #   opt.separator ''
    #   opt.separator 'Options:'
    #   opt.on("--haml", "Generate HAML for view, and SASS for stylesheet.") { |v| options[:haml] = v }
    # end

    def banner
      <<-EOS
Creates generic layout, stylesheet, and helper files.

USAGE: #{$0} #{spec.name} [project_name]
EOS
    end
end
