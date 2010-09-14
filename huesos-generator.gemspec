Gem::Specification.new do |s|
  s.name    = 'huesos-generator'
  s.version = '0.1'
  s.date    = Date.today.to_s
  
  s.summary = "Generates a basic template for sites in Rails"
  s.description = "Generates a clean and ready standardized-template for sites in Rails"
  
  s.author   = 'Guillermo Domínguez'
  s.email    = 'me@memiux.com'
  s.homepage = 'http://github.com/idsign/huesos'
  
  s.files = Dir.glob('rails_generators/**/*') + %w(LICENSE README.md)
  
  s.rubyforge_project = s.name
end
