Refinery::Page.class_eval do
  def self.footer_menu_pages
    where show_in_footer: true
  end
end
