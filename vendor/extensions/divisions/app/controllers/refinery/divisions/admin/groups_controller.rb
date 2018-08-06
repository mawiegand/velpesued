module Refinery
  module Divisions
    module Admin
      class GroupsController < ::Refinery::AdminController

        crudify :'refinery/divisions/group',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def group_params
          params.require(:group).permit(:name, :photo_id, :description)
        end
      end
    end
  end
end
