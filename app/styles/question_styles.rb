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
    font: UIFont.boldSystemFontOfSize(40),
    width: '90%',
    height: '90%',
    center: ['50%', '47%']

  style :swipe_help,
    contentMode: UIViewContentModeScaleAspectFit,
    width: '90%',
    center: ['50%','10%']

  style :tap_help,
    contentMode: UIViewContentModeScaleAspectFit,
    width: '90%',
    center: ['50%', '30%']

end
