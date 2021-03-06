
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kana_row/version"

Gem::Specification.new do |spec|
  spec.name          = "kana_row"
  spec.version       = KanaRow::VERSION
  spec.authors       = ["ichi"]
  spec.email         = ["ichi.ttht.1@gmail.com"]

  spec.summary       = %q{Detect japanese kana row.}
  spec.description   = %q{Detect japanese kana row.}
  spec.homepage      = "https://github.com/ichi/kana_row"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'mojinizer', '~> 0.2'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
