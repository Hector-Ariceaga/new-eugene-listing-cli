require_relative "./lib/new_eugene_listing_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "new_eugene_listing_cli"
  spec.version       = NewEugeneListingCli::VERSION
  spec.authors       = ["'Hector Ariceaga'"]
  spec.email         = ["'hector_ariceaga@hotmail.com'"]

  spec.summary       = %q{New property listings in Eugene, Oregon.}
  spec.description   = %q{Provides information on new property listings in Eugene, Or. posted on Trulia.}
  spec.homepage      = "https://github.com/Hector-Ariceaga/new-eugene-listing-cli.git"
  spec.license       = "MIT"

  spec.files         = ["config/environment.rb", "lib/new_eugene_listing_cli/cli.rb", "lib/new_eugene_listing_cli/listing.rb", "lib/new_eugene_listing_cli/scraper.rb"]
  spec.bindir        = "bin"
  spec.executables   << "new-eugene-listings"
  spec.require_paths = ["lib", "lib/new_eugene_listing_cli"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
