lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'loggun/version'

Gem::Specification.new do |spec|
  spec.name          = 'loggun'
  spec.version       = Loggun::VERSION
  spec.authors       = ['Aleksandr Noskov', 'Sergey Nesterov']
  spec.email         = ['nemestny@politeh.ru', 'qnesterr@gmail.com']

  spec.summary       = 'Loggun'
  spec.description   = 'Gem for formatting ruby application logs'
  spec.homepage      = 'https://github.com/funbox/loggun'
  spec.license       = 'MIT'

  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'clockwork', '~> 2.0'
  spec.add_development_dependency 'http', '~> 4.0'

  spec.add_development_dependency 'rails', '~> 6.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.0'
  spec.add_development_dependency 'sidekiq', '~> 6.0'
end
