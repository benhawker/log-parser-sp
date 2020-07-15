# frozen_string_literal: true

# Parser - read from the logfile.
# Returns the logfile data in a hash keyed by the path
# with values as an array of ip addresses for each visit
# to the given path
#
# Usage:
#   parser = Parser.new.read(log_path: "path_to/file")
#   parser.parse

require 'uri'
require 'pry'

require './lib/formatter'
require './lib/sorter'

require './lib/sort_types/by_page_views'
require './lib/sort_types/by_unique_page_views'

class Parser
  DEFAULT_LOG_PATH = 'source/webserver.log'

  def initialize(log_path: nil)
    @log_path = log_path || DEFAULT_LOG_PATH
  end

  def parse
    log_data = Hash.new { |hash, key| hash[key] = [] }

    File.open(@log_path).each do |line|
      path, ip = line.split

      log_data[path] << ip
    end

    log_data
  end
end
