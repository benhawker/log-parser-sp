# frozen_string_literal: true

# Formatter - handles formatting the output correctly in the console
#
# Usage:
#   formatter = Formatter.new(log_data: { '/path' => [ip1, ip2], ...}, sort_klass: SortTypes::ByPageViews )
#   formatter.format

class Formatter
  def initialize(log_data:, sort_klass:)
    @log_data = log_data
    @sort_klass = sort_klass
  end

  def format
    title; formatted_counts
  end

  private

  attr_reader :log_data, :sort_klass

  def title
    puts sort_klass.title
  end

  def formatted_counts
    sorted_data.each do |path, views|
      puts path.to_s + ' ' + "#{sort_klass.sort_by_absolute(views)} #{sort_klass.append_text} \n"
    end; nil
  end

  def sorted_data
    Sorter.new(log_data: log_data, sort_klass: sort_klass).sort
  end
end
