module Refinery
  module Facilities
    module Admin
      class FacilitiesController < ::Refinery::AdminController

        crudify :'refinery/facilities/facility',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def facility_params
          params.require(:facility).permit(:name, :photo_id, :address, :maps_link)
        end
      end
    end
  end
end
