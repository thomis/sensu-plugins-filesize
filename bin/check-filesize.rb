#! /usr/bin/env ruby
#
#   check-filesize
#
# DESCRIPTION:
#
#   This plugin allows to search for files based o file size
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
         description: 'Name of folder',
         short: '-f FOLDERNAME',
         long: '--folder FOLDERNAME'

  option :filesize,
         description: 'Size of file',
         short: '-s FILESIZE',
         long: '--size FILESIZE'

  def run

    files_found = `find #{config[:foldername]} -type f -size #{config[:filesize]}`.strip.lines

    if files_found.size == 0
      return ok('')
    else
      buffer = ["Files found: #{files_found.size}"]
      buffer << nil

      files_found.each do |file|
        file.strip!
        buffer << "#{file} > #{File.size(file)}"
      end

      warning(buffer.join("\n"))
    end
  end

end
