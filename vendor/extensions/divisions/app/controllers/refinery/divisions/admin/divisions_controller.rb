module Refinery
  module Divisions
    module Admin
      class DivisionsController < ::Refinery::AdminController

        crudify :'refinery/divisions/division',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def division_params
          params.require(:division).permit(:name, :description)
        end
      end
    end
  end
end
