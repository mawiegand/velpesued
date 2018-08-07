module Refinery
  module Divisions
    class GroupsController < ::ApplicationController

      before_action :find_page

      def show
        @group = Group.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @group in the line below:
        present(@page)
      end

    protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/groups").first
      end

    end
  end
end
