class QuestionScreen < PM::Screen
  stylesheet :question_stylesheet

  title "Ruby Trivia"

  def will_appear
    @view_setup ||= set_up_view
  end

  def set_up_view
    set_attributes self.view, stylename: :question_view
    add @label = UILabel.new, stylename: :my_label
    add @seg = UISegmentedControl.bar(["Settings","New Question","Answer"]), stylename: :segmented
    ap "Added label"
    true
  end

  def on_load
    ap "Label is #{@label}"
    @trivia = Trivia.new
    @trivia.next_line
    #label.text = @trivia.next_line
    #@trivia.fit_to_size(40)

  end

end
