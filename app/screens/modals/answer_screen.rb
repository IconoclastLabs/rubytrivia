class AnswerScreen < PM::Screen
  include TriviaModal
  stylesheet :trivia_stylesheet
  title "Answer"

  def answer=(answer_text)
    @view_is_set_up ||= set_up_view
    @label.code_style(answer_text)
    ap "Answer Setup = #{answer_text}"
  end

  def set_up_view
    set_attributes self.view, stylename: :trivia_view
    add @label = UILabel.new, stylename: :my_label
    true
  end

end
