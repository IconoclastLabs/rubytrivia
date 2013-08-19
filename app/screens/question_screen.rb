class QuestionScreen < PM::Screen
  stylesheet :question_stylesheet

  title "Ruby Trivia"

  def on_load
    ap "Label is #{@label}"
    @trivia = Trivia.new
  end
  
  def will_appear
    @view_setup ||= set_up_view
  end

  def set_up_view
    set_attributes self.view, stylename: :question_view
    add @label = UILabel.new, stylename: :my_label
    add @seg = UISegmentedControl.bar(["Settings","New Question","Answer"]), stylename: :segmented
    ap "Added label"

    # button actions
    @seg.on(:change) { 
      ap "Touched!"
      @label.text = @trivia.next_line
      @label.fit_to_size(40)
    }

    true
  end



end
