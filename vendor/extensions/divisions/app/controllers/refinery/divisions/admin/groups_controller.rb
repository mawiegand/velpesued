module Refinery
  module Divisions
    module Admin
      class GroupsController < ::Refinery::AdminController

        before_action :find_all_divisions, except: [:show, :destroy]

        crudify :'refinery/divisions/group',
                :title_attribute => 'name'

        protected

        def find_all_divisions
          @divisions = Refinery::Divisions::Division.all
        end

        private

        # Only allow a trusted parameter "white list" through.
        def group_params
          params.require(:group).permit(:name, :division_id, :photo_id, :description)
        end
      end
    end
  end
end
