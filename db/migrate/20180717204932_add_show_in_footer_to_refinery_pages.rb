class AddShowInFooterToRefineryPages < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pages, :show_in_footer, :boolean, default: false
  end
end
