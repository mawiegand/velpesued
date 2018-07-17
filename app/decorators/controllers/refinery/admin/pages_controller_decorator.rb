Refinery::Admin::PagesController.prepend(
    Module.new do
      def permitted_page_params
        super << :show_in_footer
      end
    end
)
