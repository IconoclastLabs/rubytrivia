class HelpScreen < PM::Screen
  stylesheet HelpScreenStylesheet
  title "Help"
  include TriviaModal

  def will_appear
    set_nav_bar_button :left, title: "Close", action: :close

    append(UIImageView, :swipe_help)
    append(UIImageView, :tap_help)
    append(UIImageView, :previous_help)

    find(UIImageView).distribute(:vertical, margin: 10)

    append(UIImageView, :footer_help)
  end

end
