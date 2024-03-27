# -*- encoding: utf-8 -*-
# stub: bootstrap3-rails 3.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap3-rails".freeze
  s.version = "3.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Benjamin Canac".freeze]
  s.date = "2014-07-10"
  s.description = "Add Bootstrap v3.2.0 to your rails app. See https://github.com/twbs/bootstrap/ for more information about Bootstrap v3.0.0 RC1.".freeze
  s.email = ["canacb1@gmail.com".freeze]
  s.homepage = "https://github.com/benjamincanac/bootstrap3-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Add Bootstrap v3.2.0 to your rails app.".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 4.0.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
