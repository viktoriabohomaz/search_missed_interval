
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "search_missed_interval/version"

Gem::Specification.new do |spec|
  spec.name          = "search_missed_interval"
  spec.version       = SearchMissedInterval::VERSION
  spec.authors       = ["zlayaait"]
  spec.email         = ["viktoriazlayaa@gmail.com"]

  spec.summary       = %q{Search missed_ nterval}
  spec.description   = %q{Searching intervals in the tree}
  spec.homepage      = "https://github.com/zlayaa/search_missed_interval"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
