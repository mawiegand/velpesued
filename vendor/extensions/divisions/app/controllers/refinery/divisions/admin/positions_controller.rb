module Refinery
  module Divisions
    module Admin
      class PositionsController < ::Refinery::AdminController

        before_action :find_all_contacts, except: [:show, :destroy]

        crudify :'refinery/divisions/position'

        protected

        def find_all_contacts
          @contacts = Refinery::Contacts::Contact.all
        end

        private

        # Only allow a trusted parameter "white list" through.
        def position_params
          params.require(:position).permit(:title, :contact_id)
        end
      end
    end
  end
end
