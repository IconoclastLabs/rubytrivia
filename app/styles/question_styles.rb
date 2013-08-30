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
    center: ['50%','15%']

  style :tap_help,
    contentMode: UIViewContentModeScaleAspectFit,
    width: '90%',
    center: ['50%', '40%']

  style :previous_help,
    contentMode: UIViewContentModeScaleAspectFit,
    width: '90%',
    center: ['50%', '65%']

  style :footer_help,
    contentMode: UIViewContentModeScaleAspectFit,
    width: '100%',
    center: ['50%','90%']      

end
