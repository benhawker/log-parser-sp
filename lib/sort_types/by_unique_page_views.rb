# frozen_string_literal: true

module SortTypes
  class ByUniquePageViews
    class << self
      def sort_by(views)
        -views.uniq.count
      end

      def sort_by_absolute(views)
        views.uniq.count
      end

      def title
        "Page views by unique views (desc order): \n"
      end

      def append_text
        'visits'
      end
    end
  end
end
