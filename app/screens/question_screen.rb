class QuestionScreen < PM::Screen
  stylesheet QuestionScreenStylesheet
  title "Ruby Trivia"

  def will_appear
    set_up_view
    @label.code_style(@trivia.current_quip["question"])
  end

  def set_up_view
    set_nav_bar_button :left, title: "Help", action: :help_tapped
    set_nav_bar_button :right, title: "About", action: :about_tapped

    @label = append!(UILabel, :main_label)

    # our trivia engine
    @trivia = Trivia.new

    rmq(view).on(:tap) do
      mp "Tapped: Show Answer"
      open_modal AnswerScreen.new(nav_bar: true,
        transition_style: UIModalTransitionStyleFlipHorizontal,
        presentation_style: UIModalPresentationFormSheet,
        answer: @trivia.current_quip["answer"])
    end

    # view.on_swipe :left do
    #   ap "Swiped: Show Next"
    #   new_question(@label, @trivia.next["question"])
    # end

    # view.on_swipe :right do
    #   ap "Swiped: Show Previous"
    #   new_question(@label, @trivia.previous["question"], :right)
    # end

  end

  private

    def new_question (question_view, new_question, swipe_direction = :left)
      start_frame = question_view.frame
      # simply slides away the current question with a fade,
      # invisibly sets the new text and fades it in
      # ~ thank you sugarcube!
      UIView.animation_chain do
        question_view.fade_out
        question_view.slide swipe_direction
      end.and_then do
        question_view.code_style(new_question)
        question_view.frame = start_frame
      end.and_then do
        question_view.fade_in
      end.start
    end

    def about_tapped
      mp "About Called"
      open AboutScreen.new(nav_bar: true, trivia: @trivia)
    end

    def help_tapped
      mp "Help Called"
      open_modal HelpScreen.new(nav_bar: true)
    end

end
