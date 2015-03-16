class AnswerScreen < PM::Screen
  include TriviaModal
  stylesheet AnswerScreenStylesheet
  title "Answer"
  attr_accessor :answer

  def will_appear
    @label = append!(UILabel, :main_text)
    @label.code_style(answer)
  end

  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
    @label.code_style(answer)
  end

end
