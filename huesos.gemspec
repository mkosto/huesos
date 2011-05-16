Gem::Specification.new do |s|
  s.name    = 'huesos'
  s.version = '0.4'
  s.date    = Date.today.to_s
  
  s.summary = "Generates a basic template for sites in Rails"
  s.description = "Generates an awesome and ready to use standardized-template for sites in Rails"
  
  s.author   = 'Guillermo Domínguez'
  s.email    = 'me@memiux.com'
  s.homepage = 'http://github.com/idsign/huesos'
  
  s.files = Dir.glob('{rails_generators}/**/*') + %w(LICENSE README.md)
  
  s.rubyforge_project = s.name
  s.has_rdoc = false
end
