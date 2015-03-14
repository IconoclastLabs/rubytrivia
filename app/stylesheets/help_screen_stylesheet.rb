class HelpScreenStylesheet < ApplicationStylesheet
  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    screen_style(st)
  end

  def help_image (st, image_name)
    st.image = image.resource(image_name)
    st.frame = {w: screen_width, h: 110, t: 100, l: 0, padding: 10}
  end

  def swipe_help st
    help_image(st, "swipe")
  end

  def tap_help st
    help_image(st, "tap")
  end

  def previous_help st
    help_image(st, "previous")
  end

  def footer_help st
    st.frame = {w: screen_width, h: 110, fb: 0}
    st.image = image.resource("footer")
  end

end