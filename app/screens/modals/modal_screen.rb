class ModalScreen < PM::Screen
  title "I'm a Modal"
  
  def will_appear
    @view_is_set_up ||= set_up_view
  end
  
  def set_up_view
    set_nav_bar_button :left, title: "Close", action: :close_modal_tapped
    true
  end
  
  def close_modal_tapped
    close foo: true
  end
end
