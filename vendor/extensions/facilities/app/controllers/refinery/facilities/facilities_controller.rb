module Refinery
  module Facilities
    class FacilitiesController < ::ApplicationController

      before_action :find_all_facilities
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @facility in the line below:
        present(@page)
      end

    protected

      def find_all_facilities
        @facilities = Facility.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/facilities").first
      end

    end
  end
end
