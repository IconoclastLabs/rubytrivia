class AnswerScreenStylesheet < ApplicationStylesheet
  def setup
    # Add sytlesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    screen_style(st)
  end

  def main_text st
    st.number_of_lines = :unlimited
    st.frame = {t: 10, w: screen_width - 20, l: 10, h: screen_height - 20}
    st.font = font.large
    st.text_alignment = :center
  end
end