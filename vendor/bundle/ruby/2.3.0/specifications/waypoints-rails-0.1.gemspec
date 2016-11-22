# -*- encoding: utf-8 -*-
# stub: waypoints-rails 0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "waypoints-rails"
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Yoav Matchulsky"]
  s.date = "2014-02-05"
  s.description = "jquery-waypoints support for Rails"
  s.email = ["yoavmatchulsky@gmail.com"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Waypoints is a jQuery plugin that makes it easy to execute a function whenever you scroll to an element. More info is at http://imakewebthings.com/jquery-waypoints/"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
