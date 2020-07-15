# frozen_string_literal: true

# Sorter - sorts the raw log output as specified by the passed sort_klass
#
# Usage:
#   sorter = Sorter.new(log_data: { '/path' => [ip1, ip2], ...}, sort_klass: SortTypes::ByPageViews )
#   sorter.sort

class Sorter
  class InvalidSortClassError < StandardError; end

  def initialize(log_data:, sort_klass:)
    @log_data = log_data
    @sort_klass = sort_klass
  end

  def sort
    raise InvalidSortClassError, @sort_klass.name unless @sort_klass.respond_to? :sort_by

    @log_data.sort_by { |_path, views| @sort_klass.sort_by(views) }
  end
end
