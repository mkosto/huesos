require File.expand_path(File.dirname(__FILE__) + "/lib/insert_commands.rb")
class HuesosGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @project_name = @args.first || 'Huesos'
  end

  def manifest
    record do |m|
      
      Dir.chdir(File.expand_path(File.dirname(__FILE__) + "/files")) do
        Dir.glob("**/").each {|f| m.directory f}
        Dir.glob(File.join("**", "*.*")).each do |f|
          m.file "../files/#{f}", f
        end
      end

      %w( application _footer).each do |file|
        m.template "app/views/layouts/#{file}.html.erb", "app/views/layouts/#{file}.html.erb"
      end

      m.insert_into "app/controllers/application_controller.rb", "class ApplicationController < ActionController::Base", "  include MetadataExtractor"
    end
  end

  def project_name
    @project_name
  end

end
