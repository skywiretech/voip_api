$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "voip_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "voip_api"
  s.version     = VoipApi::VERSION
  s.authors     = ["Mark D Holmberg"]
  s.email       = ["mark.d.holmberg@gmail.com"]
  s.homepage    = "http://www.markholmberg.com"
  s.summary     = "VOIP API is a Ruby gem for communicating with the VOIP Innovations API."
  s.description     = "VOIP API is a Ruby gem for communicating with the VOIP Innovations API."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "4.0.2"

  s.add_development_dependency "mysql"
end
