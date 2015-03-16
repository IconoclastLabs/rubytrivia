class HelpScreenStylesheet < ApplicationStylesheet
  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_image = image.resource('retina_wood')
  end

  def help_image (st, image_name)
    st.image = image.resource(image_name)
    # Adjust top depending on orientation
    from_top = (device.orientation == :portrait) ? 100 : 50;
    st.frame = {w: screen_width, h: screen_height/5, t: from_top, l: 0, padding: 10}
    st.content_mode = UIViewContentModeScaleAspectFit

    st.tag(:help_image)
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