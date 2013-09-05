class AnswerScreen < PM::Screen
  include TriviaModal
  stylesheet :trivia_stylesheet
  title "Answer"
  attr_accessor :answer

  def will_appear
    @view_is_set_up ||= set_up_view
    @label.code_style(answer)
    ap "Answer will appear"
  end

  def set_up_view
    set_attributes self.view, stylename: :trivia_view
    add @label = UILabel.new, stylename: :my_label
    true
  end

end
