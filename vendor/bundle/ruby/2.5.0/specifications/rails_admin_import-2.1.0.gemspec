# -*- encoding: utf-8 -*-
# stub: rails_admin_import 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_admin_import".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Steph Skardal".freeze, "Julien Vanier".freeze]
  s.date = "2017-11-18"
  s.email = ["steph@endpoint.com".freeze, "jvanier@gmail.com".freeze]
  s.homepage = "https://github.com/stephskardal/rails_admin_import".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Import functionality for Rails Admin".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.2"])
      s.add_runtime_dependency(%q<rails_admin>.freeze, [">= 0.6.6"])
      s.add_runtime_dependency(%q<rchardet>.freeze, ["~> 1.6"])
      s.add_runtime_dependency(%q<simple_xlsx_reader>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 3.2"])
      s.add_dependency(%q<rails_admin>.freeze, [">= 0.6.6"])
      s.add_dependency(%q<rchardet>.freeze, ["~> 1.6"])
      s.add_dependency(%q<simple_xlsx_reader>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.2"])
    s.add_dependency(%q<rails_admin>.freeze, [">= 0.6.6"])
    s.add_dependency(%q<rchardet>.freeze, ["~> 1.6"])
    s.add_dependency(%q<simple_xlsx_reader>.freeze, ["~> 1.0"])
  end
end
