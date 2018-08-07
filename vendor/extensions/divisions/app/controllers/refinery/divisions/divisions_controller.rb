module Refinery
  module Divisions
    class DivisionsController < ::ApplicationController

      before_action :find_all_divisions
      before_action :find_page

      def show
        @division = Division.find(params[:id])
        @groups = Group.where(division_id: @division.id).order('position ASC')

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
