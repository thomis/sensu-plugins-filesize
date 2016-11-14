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
  check-filesize.rb -f /apps -s 50c
  ```

## About the -s or -size option

The size option is transparently passed to the find command. More details can be found in the man pages of the find command (> man find).

## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)
