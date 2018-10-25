# -*- encoding: utf-8 -*-
# stub: tumblr_client 0.8.5 ruby lib

Gem::Specification.new do |s|
  s.name = "tumblr_client".freeze
  s.version = "0.8.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Bunting".freeze, "John Crepezzi".freeze]
  s.date = "2014-12-01"
  s.description = "A Ruby wrapper for the Tumblr v2 API".freeze
  s.email = ["codingjester@gmail.com".freeze, "john@crepezzi.com".freeze]
  s.executables = ["tumblr".freeze]
  s.files = ["bin/tumblr".freeze]
  s.homepage = "http://github.com/tumblr/tumblr_client".freeze
  s.licenses = ["Apache".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Tumblr API wrapper".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<simple_oauth>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<oauth>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mime-types>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<faraday>.freeze, ["~> 0.9.0"])
      s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.9.0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<simple_oauth>.freeze, [">= 0"])
      s.add_dependency(%q<oauth>.freeze, [">= 0"])
      s.add_dependency(%q<mime-types>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 0.9.0"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.9.0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<simple_oauth>.freeze, [">= 0"])
    s.add_dependency(%q<oauth>.freeze, [">= 0"])
    s.add_dependency(%q<mime-types>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
