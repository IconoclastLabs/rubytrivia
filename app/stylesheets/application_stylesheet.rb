class ApplicationStylesheet < RubyMotionQuery::Stylesheet

  def application_setup

    font_family = 'Helvetica Neue'
    font.add_named :large,    font_family, 40
    font.add_named :medium,   font_family, 36
    font.add_named :small,    font_family, 18

    color.add_named :tint, '236EB7'
    color.add_named :translucent_black, color(0, 0, 0, 0.4)
    color.add_named :battleship_gray,   '#7F7F7F'
  end

  def screen_style st
    background_image = image.resource('retina_wood')

    if st.view.is_a?(UITableView)
      st.background_color = color.clear
      st.view.backgroundView = UIImageView.alloc.initWithImage(background_image)
    else
      st.view.backgroundColor = UIColor.colorWithPatternImage(background_image)
    end
  end

end