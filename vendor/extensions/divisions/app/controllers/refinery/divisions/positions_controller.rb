module Refinery
  module Divisions
    class PositionsController < ::ApplicationController

      before_action :find_all_positions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @position in the line below:
        present(@page)
      end

      def show
        @position = Position.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @position in the line below:
        present(@page)
      end

    protected

      def find_all_positions
        @positions = Position.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/positions").first
      end

    end
  end
end
