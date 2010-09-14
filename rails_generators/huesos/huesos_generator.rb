class HuesosGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @project_name = @args.first || 'Huesos'
  end
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets'
      m.directory 'app/helpers'
      
      m.template "application.html.erb", "app/views/layouts/application.html.erb"
      m.file "base.css",  "public/stylesheets/base.css"
      m.file "layout_helper.rb", "app/helpers/layout_helper.rb"
    end
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

USAGE: #{$0} #{spec.name} [projec_name]
EOS
    end
end
