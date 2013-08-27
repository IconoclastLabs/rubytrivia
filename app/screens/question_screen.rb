class QuestionScreen < PM::Screen
  stylesheet :question_stylesheet
  title "Ruby Trivia"

  def will_appear
    @view_setup ||= set_up_view
  end

  def set_up_view
    set_nav_bar_button :left, title: "Help", action: :help_tapped
    set_nav_bar_button :right, title: "Settings", action: :settings_tapped
    set_attributes self.view, stylename: :question_view
    add @label = UILabel.new, stylename: :my_label
    # our trivia engine
    @trivia = Trivia.new

    view.on_tap do
      ap "Tapped: Show Answer"
      answer = AnswerScreen.new(nav_bar: true, answer: @trivia.current_quip["answer"])
      answer.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
      open_modal answer
    end

    view.on_swipe :left do
      ap "Swiped: Show Next"
      new_question @label, @trivia.next_line
    end
    true
  end

  private

    def new_question question_view, new_question
      start_frame = question_view.frame
      styled_question = style_string new_question
      # simply slides away the current question with a fade,
      # invisibly sets the new text and fades it in
      # ~ thank you sugarcube!
      UIView.animation_chain do
        question_view.fade_out
        question_view.slide :left
      end.and_then do
        question_view.text = new_question
        question_view.fit_to_size(40)
        question_view.attributedText = styled_question
        question_view.frame = start_frame
      end.and_then do
        question_view.fade_in
      end.start
    end

    def style_string question
      ranges = []
      current_pos = 0
      current_q = question.strip
      # find code and fill ranges array
      current_q.scan(/`[^`]+`/).each do |code|
        ap "Need to replace #{code}"
        start_pos = current_q.index(code, current_pos)
        end_pos = start_pos + code.length
        ap "adding #{start_pos} and #{end_pos}"
        ranges.push(start_pos..end_pos)
      end

      font_attrs = MotionMap::Map[NSFontAttributeName, UIFont.fontWithName( 'Courier', size: 40 )]
      # remove backticks, but keep the count
      question_styled = NSMutableAttributedString.alloc.initWithString( current_q.gsub("`"," "), attributes: nil ).tap do |attrs|
        ranges.each do |code_range|
          attrs.setAttributes( font_attrs, range: code_range)
        end
      end

      question_styled
    end

    def settings_tapped
      ap "Settings Called"
      open SettingsScreen.new(nav_bar: true, trivia: @trivia)
    end

    def help_tapped
      ap "Help Called"
      open_modal HelpScreen.new(nav_bar: true)
    end

end
