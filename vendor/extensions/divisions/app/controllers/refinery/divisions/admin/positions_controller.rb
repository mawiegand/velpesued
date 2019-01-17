module Refinery
  module Divisions
    module Admin
      class PositionsController < ::Refinery::AdminController

        crudify :'refinery/divisions/position'

        private

        # Only allow a trusted parameter "white list" through.
        def position_params
          params.require(:position).permit(:title)
        end
      end
    end
  end
end
