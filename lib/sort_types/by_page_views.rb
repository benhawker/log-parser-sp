# frozen_string_literal: true

module SortTypes
  class ByPageViews
    class << self
      def sort_by(views)
        -views.count
      end

      def sort_by_absolute(views)
        views.count
      end

      def title
        "Page views by total views (desc order): \n"
      end

      def append_text
        'visits'
      end
    end
  end
end
