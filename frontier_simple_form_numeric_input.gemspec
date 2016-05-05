# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "frontier_simple_form_numeric_input"
  s.version     = "0.1.0"
  s.authors     = ["Jordan Maguire"]
  s.email       = ["jordan@thefrontiergroup.com.au"]
  s.homepage    = "https://github.com/thefrontiergroup/frontier_simple_form_numeric_input"
  s.summary     = "Override the default numeric input that SimpleForm provides so that it uses validations found on the Rails models to determine min/max values."
  s.description = "Override the default numeric input that SimpleForm provides so that it uses validations found on the Rails models to determine min/max values."
  s.licenses    = ['MIT']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 4"
  s.add_dependency "simple_form", ">= 3"

  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec_junit_formatter"
  s.add_development_dependency "byebug"

end
