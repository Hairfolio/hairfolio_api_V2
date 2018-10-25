# -*- encoding: utf-8 -*-
# stub: pinterest-api 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "pinterest-api".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Adeel Ahmad".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-05-24"
  s.description = "This gem makes it simple to interact with the official Pinterest REST API".freeze
  s.email = ["adeel.rb@gmail.com".freeze]
  s.homepage = "http://github.com/realadeel/pinterest-api".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Ruby gem to interact with the Pinterest REST API".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.3"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 2.9"])
      s.add_development_dependency(%q<dotenv>.freeze, ["~> 2.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.0.1"])
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<hashie>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<omniauth>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.3"])
      s.add_dependency(%q<vcr>.freeze, ["~> 2.9"])
      s.add_dependency(%q<dotenv>.freeze, ["~> 2.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.0.1"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.9"])
      s.add_dependency(%q<hashie>.freeze, ["~> 3.0"])
      s.add_dependency(%q<omniauth>.freeze, ["~> 1.0"])
      s.add_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.3"])
    s.add_dependency(%q<vcr>.freeze, ["~> 2.9"])
    s.add_dependency(%q<dotenv>.freeze, ["~> 2.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.0.1"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["~> 0.9"])
    s.add_dependency(%q<hashie>.freeze, ["~> 3.0"])
    s.add_dependency(%q<omniauth>.freeze, ["~> 1.0"])
    s.add_dependency(%q<omniauth-oauth2>.freeze, ["~> 1.0"])
  end
end
