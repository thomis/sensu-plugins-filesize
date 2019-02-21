[![Gem Version](https://badge.fury.io/rb/sensu-plugins-filesize.svg)](https://badge.fury.io/rb/sensu-plugins-filesize)
[![Maintainability](https://api.codeclimate.com/v1/badges/83cc2ff8ee1d6db49b32/maintainability)](https://codeclimate.com/github/thomis/sensu-plugins-filesize/maintainability)
[![Build Status](https://travis-ci.org/thomis/sensu-plugins-filesize.svg?branch=master)](https://travis-ci.org/thomis/sensu-plugins-filesize)

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

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)
