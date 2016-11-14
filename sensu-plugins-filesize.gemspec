# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sensu/plugins/filesize/version'

Gem::Specification.new do |spec|
  spec.name                   = "sensu-plugins-filesize"
  spec.version                = Sensu::Plugins::Filesize::VERSION

  spec.authors                = ["Sensu-Plugins and contributors"]
  spec.email                  = ["thomas.steiner@ikey.ch"]

  spec.summary                = 'Sensu plugin to search files based on size'
  spec.description            = 'Sensu plugin to search files based on size'
  spec.homepage               = 'https://github.com/thomis/sensu-plugins-filesize'
  spec.license                = 'MIT'

  spec.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  spec.files                  = Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)

  spec.platform               = Gem::Platform::RUBY
  spec.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  spec.require_paths          = ['lib']
  spec.required_ruby_version  = '>= 1.9.3'

  spec.metadata               = { 'maintainer'         => 'thomis',
                                  'development_status' => 'active',
                                  'production_status'  => 'unstable - testing recommended',
                                  'release_draft'      => 'false',
                                  'release_prerelease' => 'false' }

  spec.add_runtime_dependency 'sensu-plugin', '~> 1.4.2'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 11.3"
  spec.add_development_dependency "rspec", "~> 3.5"
end
