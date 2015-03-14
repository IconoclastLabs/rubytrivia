class HelpScreen < PM::Screen
  include TriviaModal
  stylesheet HelpScreenStylesheet
  title "Help"

  def will_appear
    set_nav_bar_button :left, title: "Close", action: :close
  end

  def set_up_view
    set_attributes self.view, stylename: :trivia_view
    add UIImageView.alloc.initWithImage('swipe.png'.uiimage), stylename: :swipe_help
    add UIImageView.alloc.initWithImage('tap.png'.uiimage), stylename: :tap_help
    add UIImageView.alloc.initWithImage('previous.png'.uiimage), stylename: :previous_help
    add labs = UIImageView.alloc.initWithImage('footer.png'.uiimage), stylename: :footer_help

    true
  end

end
