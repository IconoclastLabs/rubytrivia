class HelpScreen < PM::Screen
  include TriviaModal
  stylesheet :trivia_stylesheet
  title "Help"
  
  def will_appear
    @view_is_set_up ||= set_up_view
  end
  
  def set_up_view
    set_attributes self.view, stylename: :trivia_view
    set_nav_bar_button :left, title: "Close", action: :close_modal_tapped
    add UIImageView.alloc.initWithImage('swipe.png'.uiimage), stylename: :swipe_help
    add UIImageView.alloc.initWithImage('tap.png'.uiimage), stylename: :tap_help
    add UIImageView.alloc.initWithImage('previous.png'.uiimage), stylename: :previous_help
    add labs = UIImageView.alloc.initWithImage('footer.png'.uiimage), stylename: :footer_help

    true
  end

  def close_modal_tapped
    close
  end
  
end
