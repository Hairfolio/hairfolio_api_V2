# -*- encoding: utf-8 -*-
# stub: skylight 2.0.1 ruby lib
# stub: ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "skylight".freeze
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tilde, Inc.".freeze]
  s.date = "2018-05-01"
  s.email = ["engineering@tilde.io".freeze]
  s.executables = ["skylight".freeze]
  s.extensions = ["ext/extconf.rb".freeze]
  s.files = ["bin/skylight".freeze, "ext/extconf.rb".freeze]
  s.homepage = "http://www.skylight.io".freeze
  s.licenses = ["Nonstandard".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.7".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Skylight is a smart profiler for Rails, Sinatra, and other Ruby apps.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<skylight-core>.freeze, ["= 2.0.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.15"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
      s.add_development_dependency(%q<rspec-collection_matchers>.freeze, ["~> 1.1"])
      s.add_development_dependency(%q<beefcake>.freeze, ["< 1.0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
      s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.0.4"])
    else
      s.add_dependency(%q<skylight-core>.freeze, ["= 2.0.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
      s.add_dependency(%q<rspec-collection_matchers>.freeze, ["~> 1.1"])
      s.add_dependency(%q<beefcake>.freeze, ["< 1.0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<rack-test>.freeze, [">= 0"])
      s.add_dependency(%q<timecop>.freeze, ["~> 0.9"])
      s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0.4"])
    end
  else
    s.add_dependency(%q<skylight-core>.freeze, ["= 2.0.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_dependency(%q<rspec-collection_matchers>.freeze, ["~> 1.1"])
    s.add_dependency(%q<beefcake>.freeze, ["< 1.0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0.4"])
  end
end
