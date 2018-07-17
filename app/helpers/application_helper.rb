module ApplicationHelper
  def footer_menu
    menu_items = Refinery::Menu.new(Refinery::Page.footer_menu_pages)

    Refinery::Pages::MenuPresenter.new(menu_items, self).tap do |presenter|
      presenter.dom_id = "footer_menu"
      presenter.css = "footer_menu"
    end
  end
end
