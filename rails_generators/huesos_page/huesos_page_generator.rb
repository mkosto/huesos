class HuesosPageGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @directory = @args[0] || "pages"
    @page_name = @args[1] || "template"
  end

  def manifest
    record do |m|
      m.directory "app/views/#{directory}"

      m.template "views/#{template_name}.html.erb", "app/views/#{file_name}.html.erb"
    end
  end

  def directory
    @directory.underscore
  end

  def page_name
    @page_name.humanize
  end

  def template_name
    options[:layout] ||= "two_columns"
  end

  def file_name
    "#{@directory.underscore}/#{@page_name.underscore}"
  end

  protected

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--layout=", "Name of the layout-template: one_column, two_columns (default)") { |v| options[:layout] = v }
  end

  def banner
    <<-EOS
Usage: #{$0} #{spec.name} [directory] [page_name] [options]
EOS
  end

end
