Teacup::Stylesheet.new :question_stylesheet do
  style :question_view,
    backgroundColor: 'retina_wood'.uicolor

  style :my_label,
    backgroundColor: UIColor.clearColor,
    text: "Welcome to Ruby Trivia!",
    #textColor: UIColor.whiteColor,
    #shadowColor: UIColor.blackColor,
    numberOfLines: 0,
    textAlignment: UITextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(18.0),
    frame: CGRectMake(10, 10, 300, 400)

  style :segmented,
    constraints: [
      :center_x,
      :full_width,
      constrain_bottom(-5)
    ],
    width: 300,
    height: 40,
    top: '85%',
    center_x: '50%'
end
