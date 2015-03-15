class QuestionScreen < PM::Screen
  stylesheet QuestionScreenStylesheet
  title "Ruby Trivia"

  def on_load
    set_up_view
    @label.code_style(@trivia.current_quip["question"])
  end

  def set_up_view
    set_nav_bar_button :left, title: "Help", action: :help_tapped
    set_nav_bar_button :right, title: "About", action: :about_tapped

    @label = append!(UILabel, :main_text)

    # our trivia engine
    @trivia = Trivia.new

    rmq(view).on(:tap) do
      mp "Tapped: Show Answer"
      open_modal AnswerScreen.new(nav_bar: true,
        transition_style: UIModalTransitionStyleFlipHorizontal,
        presentation_style: UIModalPresentationFormSheet,
        answer: @trivia.current_quip["answer"])
    end

    rmq(view).on(:swipe_left) do
      mp "Swiped: Show Next"
      new_question(@label, @trivia.next["question"])
    end

    rmq(view).on(:swipe_right) do
      mp "Swiped: Show Previous"
      new_question(@label, @trivia.previous["question"], :right)
    end
  end

  private

    def new_question (question_view, new_question, swipe_direction = :left)
      start_frame = question_view.frame

      rmq(question_view).animations.slide_out(to_direction: swipe_direction, duration: 0.2, completion: -> (f, q) {
        q.get.code_style(new_question)
        q.get.alpha = 0
        opts = {
          duration: 0.4,
          options: UIViewAnimationOptionCurveEaseOut,
          before: ->(bq) {
            case swipe_direction
            when :left
              bq.move(l: rmq.device.width)
            when :right
              bq.move(l: -rmq.device.width)
            end
          },
          animations: ->(aq, return_var) {
            aq.frame = start_frame
            aq.get.alpha = 1
          }
        }
        q.animate(opts)
      })

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
