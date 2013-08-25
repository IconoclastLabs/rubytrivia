class AnswerScreen < PM::Screen
  stylesheet :question_stylesheet
  title "Answer"

  def answer=(answer_text)
    @view_is_set_up ||= set_up_view
    @label.text = answer_text
    @label.fit_to_size(40)
  end

  def set_up_view
    set_nav_bar_button :left, title: "Close", action: :close_modal_tapped
    set_attributes self.view, stylename: :question_view
    add @label = UILabel.new, stylename: :my_label
    true
  end
  
  def close_modal_tapped
    close foo: true
  end
end
