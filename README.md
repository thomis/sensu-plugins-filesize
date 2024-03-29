[![Gem Version](https://badge.fury.io/rb/sensu-plugins-filesize.svg)](https://badge.fury.io/rb/sensu-plugins-filesize)
[![Maintainability](https://api.codeclimate.com/v1/badges/83cc2ff8ee1d6db49b32/maintainability)](https://codeclimate.com/github/thomis/sensu-plugins-filesize/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/83cc2ff8ee1d6db49b32/test_coverage)](https://codeclimate.com/github/thomis/sensu-plugins-filesize/test_coverage)
[![ci](https://github.com/thomis/sensu-plugins-filesize/actions/workflows/ci.yml/badge.svg)](https://github.com/thomis/sensu-plugins-filesize/actions/workflows/ci.yml)

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

- 3.2
- 3.1
- 3.0
- 2.7 (EOL March 31 2023, is not part of CI anymore)
- 2.6 (EOL March 31 2022, is not part of CI anymore)
