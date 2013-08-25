class AnswerScreen < PM::Screen
  stylesheet :question_stylesheet
  title "Answer"

  def answer=(answer_text)
    @view_is_set_up ||= set_up_view
    @label.text = answer_text
    @label.fit_to_size(40)
  end

  def set_up_view
    set_attributes self.view, stylename: :question_view
    add @label = UILabel.new, stylename: :my_label

    # Close modal on tap
    view.on_tap do
      close
    end

    view.on_swipe :left do
      ap "Swiped on Answer: Show that it is no function"
      view.shake
    end
    
    true
  end

end
