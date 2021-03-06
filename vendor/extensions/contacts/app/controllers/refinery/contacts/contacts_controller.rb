module Refinery
  module Contacts
    class ContactsController < ::ApplicationController

      before_action :find_all_divisions
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @contact in the line below:
        present(@page)
      end

    protected

      def find_all_divisions
        @divisions = ::Refinery::Divisions::Division.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/contacts").first
      end

    end
  end
end
