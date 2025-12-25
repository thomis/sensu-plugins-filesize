[![Gem Version](https://badge.fury.io/rb/sensu-plugins-filesize.svg)](https://badge.fury.io/rb/sensu-plugins-filesize)
[![01 - Test](https://github.com/thomis/sensu-plugins-filesize/actions/workflows/01_test.yml/badge.svg)](https://github.com/thomis/sensu-plugins-filesize/actions/workflows/01_test.yml)
[![02 - Release](https://github.com/thomis/sensu-plugins-filesize/actions/workflows/02_release.yml/badge.svg)](https://github.com/thomis/sensu-plugins-filesize/actions/workflows/02_release.yml)

# sensu-plugins-filesize

Sensu plugin to search files based on size.

## Files
  * bin/check-filesize.rb

## Usage

  ```
  -- check for files greater than 100M in home folder including subfolders
  check-filesize.rb -f ~ -s +100M

  -- check for files smaller than 100M in home folder including subfolders
  check-filesize.rb -f ~ -s -100M

  -- check for files exactly of size 50 kb in /apps folder including subfolders
  check-filesize.rb -f /apps -s 50k
  ```

## About the -s or --size option

The size option is transparently passed to the find command. More details can be found in the man pages of the find command (> man find).

## Installation

[Installation and Setup](https://docs.sensu.io/sensu-core/latest/installation/installing-plugins)

## Supported Ruby Versions

Currently supported and tested ruby versions are:

- 4.0 (EOL March 31 2029)
- 3.4 (EOL March 31 2028)
- 3.3 (EOL March 31 2027)
- 3.2 (EOL March 31 2026)

Not tested anymore

- 3.1 (EOL March 31 2025)
- 3.0 (EOL March 31 2024)
- 2.7 (EOL March 31 2023)
- 2.6 (EOL March 31 2022)

## Publishing

This project uses [Trusted Publishing](https://guides.rubygems.org/trusted-publishing/) to securely publish gems to RubyGems.org. Trusted Publishing eliminates the need for long-lived API tokens by using OpenID Connect (OIDC) to establish a trusted relationship between GitHub Actions and RubyGems.org.

With Trusted Publishing configured, gem releases are automatically published to RubyGems when the release workflow runs, providing a more secure and streamlined publishing process.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thomis/sensu-plugins-filesize. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

1. Fork it ( https://github.com/thomis/sensu-plugins-filesize/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
