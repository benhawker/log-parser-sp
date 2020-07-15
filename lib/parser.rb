# frozen_string_literal: true

# Parser - read from the logfile.
# Returns the logfile data in an array of hashes
#
# Usage:
#   parser = Parser.new.read(log_path: "path_to/file")
#   parser.parse

require 'uri'

class Parser
  DEFAULT_LOG_PATH = 'source/webserver.log'

  def initialize(log_path: nil)
    @log_path = log_path || DEFAULT_LOG_PATH
  end

  def parse
    File.open(log_path).each_with_object([]) do |line, obj|
      arr = line.split(' ')

      obj << { url: format_url(arr[0]), ip: arr[1] }
    end
  end

  private

  attr_reader :log_path

  # Remove first & last / for consistency
  def format_url(url)
    url.gsub(%r{\A/}, '').gsub(%r{/\z}, '')
  end
end
