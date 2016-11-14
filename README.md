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

  * -s or --size compare -size option from find (man size)

## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)
