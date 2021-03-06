#! /usr/bin/env ruby
#
#   check-filesize
#
# DESCRIPTION:
#
#   This plugin allows to search for files based on file size
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#   ./check-filesize.rb -f FOLDER -s SIZE
#
# NOTES:
#
# LICENSE:
#   Copyright (c) 2016 Thomas Steiner
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'

class CheckFilesize < Sensu::Plugin::Check::CLI
  option :foldername,
         description: 'Name of folder (defaut: ~)',
         short: '-f FOLDERNAME',
         long: '--folder FOLDERNAME',
         default: '~' # home folder

  option :filesize,
         description: 'Size of file',
         short: '-s FILESIZE',
         long: '--size FILESIZE',
         required: true

  def run

    raw = `find #{config[:foldername]} -type f -size #{config[:filesize]}`

    warning('Passed options seems not correct. Please verify.') if $?.exitstatus > 0

    files_found = raw.strip.lines
    if files_found.size == 0
      return ok
    else
      buffer = ["Files found: #{files_found.size}"]
      buffer << nil

      files_found.each do |file|
        file.strip!
        size = File.size(file)
        buffer << "#{file} > #{format_size(size)}"
      end

      warning(buffer.join("\n"))
    end
  end

  private

  def format_size(size)
    conv = [ 'b', 'kb', 'mb', 'gb', 'tb', 'pb', 'eb' ];
    scale = 1024;

    ndx=1
    if( size < 2*(scale**ndx)  ) then
      return "#{(size)} #{conv[ndx-1]}"
    end
    size=size.to_f
    [2,3,4,5,6,7].each do |ndx|
      if( size < 2*(scale**ndx)  ) then
        return "#{'%.3f' % (size/(scale**(ndx-1)))} #{conv[ndx-1]}"
      end
    end
    ndx=7
    return "#{'%.3f' % (size/(scale**(ndx-1)))} #{conv[ndx-1]}"
  end

end
