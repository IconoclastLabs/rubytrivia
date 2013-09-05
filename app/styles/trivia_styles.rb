Teacup::Stylesheet.new :trivia_stylesheet do
  import :base_stylesheet

  style :my_label,
    backgroundColor: UIColor.clearColor,
    numberOfLines: 0,
    textAlignment: UITextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(40),
    portrait: {
      width: '90%',
      height: '85%',
      center: ['50%', '55%']
    },
    landscape: {
      width: '90%',
      height: '85%',
      center: ['50%', '55%']
    }


############## Help Screen ################
  style :swipe_help, extends: :help_image,
    portrait: {
      center: ['50%','25%']
    },
    landscape: {
      center: ['25%','30%']
    }

  style :tap_help, extends: :help_image,
    portrait: {
      center: ['50%','47%']
    },
    landscape: {
      center: ['50%','55%']
    }

  style :previous_help, extends: :help_image,
    portrait: {
      center: ['50%','70%']
    },
    landscape: {
      center: ['75%','80%']
    }

  style :footer_help,
    contentMode: UIViewContentModeScaleAspectFit,
    portrait: {
      width: '100%',
      hidden: false,
      center: ['50%','92%']
    },
    landscape: {
      hidden: true
    }

end
