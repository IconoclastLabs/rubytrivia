class HelpScreen < PM::Screen
  stylesheet :question_stylesheet
  title "Help"
  
  def will_appear
    @view_is_set_up ||= set_up_view
  end
  
  def set_up_view
    set_attributes self.view, stylename: :question_view
    set_nav_bar_button :left, title: "Close", action: :close_modal_tapped
    add swipe = UIImageView.alloc.initWithImage('swipe.png'.uiimage), stylename: :swipe_help
    add tap = UIImageView.alloc.initWithImage('tap.png'.uiimage), stylename: :tap_help
    view.on_tap do
      close_modal_tapped
    end

    true
  end

  def close_modal_tapped
    close
  end
  
end
