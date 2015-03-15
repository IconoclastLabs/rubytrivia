class HelpScreen < PM::Screen
  stylesheet HelpScreenStylesheet
  title "Help"
  include TriviaModal

  def will_appear
    set_nav_bar_button :left, title: "Close", action: :close

    append(UIImageView, :swipe_help)
    append(UIImageView, :tap_help)
    append(UIImageView, :previous_help)
    append(UIImageView, :footer_help)

    find(:help_image).distribute(:vertical, margin: 10)
  end

  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
    find(:help_image).distribute(:vertical, margin: 10)
  end

end
