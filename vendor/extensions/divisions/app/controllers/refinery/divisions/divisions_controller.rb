module Refinery
  module Divisions
    class DivisionsController < ::ApplicationController

      before_action :find_all_divisions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @division in the line below:
        present(@page)
      end

      def show
        @division = Division.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @division in the line below:
        present(@page)
      end

    protected

      def find_all_divisions
        @divisions = Division.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/divisions").first
      end

    end
  end
end