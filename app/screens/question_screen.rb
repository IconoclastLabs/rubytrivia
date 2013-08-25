class QuestionScreen < PM::Screen
  stylesheet :question_stylesheet

  title "Ruby Trivia"

  def on_load
    set_nav_bar_button :left, title: "Help", action: :help_tapped
    set_nav_bar_button :right, title: "Settings", action: :settings_tapped
    @trivia = Trivia.new
  end
  
  def will_appear
    @view_setup ||= set_up_view
  end

  def set_up_view
    set_attributes self.view, stylename: :question_view
    add @label = UILabel.new, stylename: :my_label
    add @seg = UISegmentedControl.bar(["New Question","Answer"]), stylename: :segmented

    # button actions
    @seg.on(:change) {
      ap "Touched! #{@seg.selectedSegmentIndex}"
      case @seg.selectedSegmentIndex
      when 0
        ap "NEXT!"
        @label.text = @trivia.next_line
        @label.fit_to_size(40)
      when 1
        ap "Answer!"
        answer = AnswerScreen.new(nav_bar: true, answer: @trivia.current_quip["answer"])
        answer.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
        open_modal answer
      end

      #unselect
      @seg.setSelectedSegmentIndex(UISegmentedControlNoSegment)
    }

    true
  end

  def settings_tapped
    ap "Settings Called"
    settings = SettingsScreen.new(nav_bar: true, trivia: @trivia)
    open settings
  end

  def help_tapped
    ap "Help Called"
    modal = ModalScreen.new(nav_bar: true, trivia: @trivia)
    # Proof of how to flip the screen for this
    modal.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
    open_modal modal 
  end

end
