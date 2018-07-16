module Refinery
  module Sponsors
    module Admin
      class SponsorsController < ::Refinery::AdminController

        crudify :'refinery/sponsors/sponsor',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def sponsor_params
          params.require(:sponsor).permit(:name, :logo_id, :link_url, :published)
        end
      end
    end
  end
end
