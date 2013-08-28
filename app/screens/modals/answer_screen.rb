class AnswerScreen < PM::Screen
  include TriviaModal
  stylesheet :question_stylesheet
  title "Answer"

  def answer=(answer_text)
    @view_is_set_up ||= set_up_view
    @label.text = answer_text # take up some space
    @label.fit_to_size(40) # resize as needed
    @label.attributedText = answer_text.dup.code_style # do font madness
  end

  def set_up_view
    set_attributes self.view, stylename: :question_view
    add @label = UILabel.new, stylename: :my_label
    true
  end

end
