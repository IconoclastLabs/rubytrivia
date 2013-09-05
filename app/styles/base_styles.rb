Teacup::Stylesheet.new :base_stylesheet do
  style :trivia_view,
    backgroundColor: 'retina_wood'.uicolor,
    landscape: true

  style :help_image,
    contentMode: UIViewContentModeScaleAspectFit,
    portrait: {
      width: '90%'
    },
    landscape: {
      width: '40%'
    }
 
end
