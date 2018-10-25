# -*- encoding: utf-8 -*-
# stub: calamum 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "calamum".freeze
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alex Y.".freeze, "Mehrez Alachheb".freeze]
  s.date = "2014-11-27"
  s.email = ["lachheb.mehrez@gmail.com".freeze]
  s.executables = ["calamum".freeze]
  s.files = ["bin/calamum".freeze]
  s.homepage = "https://github.com/malachheb/calamum".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "REST API documentation generator".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<yajl-ruby>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mixlib-cli>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mixlib-config>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rainbow>.freeze, ["= 1.1.4"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.15.0"])
    else
      s.add_dependency(%q<yajl-ruby>.freeze, [">= 0"])
      s.add_dependency(%q<mixlib-cli>.freeze, [">= 0"])
      s.add_dependency(%q<mixlib-config>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rainbow>.freeze, ["= 1.1.4"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.15.0"])
    end
  else
    s.add_dependency(%q<yajl-ruby>.freeze, [">= 0"])
    s.add_dependency(%q<mixlib-cli>.freeze, [">= 0"])
    s.add_dependency(%q<mixlib-config>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rainbow>.freeze, ["= 1.1.4"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.15.0"])
  end
end
