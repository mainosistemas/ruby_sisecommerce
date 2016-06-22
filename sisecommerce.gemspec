Gem::Specification.new do |s|
  s.name        = 'ruby-sisecommerce'
  s.version     = '0.0.0'
  s.date        = '2016-06-20'
  s.summary     = 'Ruby Sisecommerce API'
  s.description = "Ruby API for Sisecommerce platform"
  s.authors     = ["Iuri Madeira"]
  s.email       = 'iurimadeira@gmail.com'
  s.files       = ["lib/ruby_sisecommerce.rb"]
  s.homepage    = 'http://rubygems.org/gems/ruby_sisecommerce'
  s.license     = 'MIT'

  s.test_files = s.files.grep(%r{^(spec|features)/})

  s.add_dependency "rest-client"

  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rspec"
  s.add_development_dependency "pry-byebug"

end
