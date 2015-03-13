class AboutScreen < PM::TableScreen
  stylesheet AboutScreenStylesheet
  attr_accessor :trivia
  title "About"

  def on_appear
    rmq.apply_style :root_view
    rmq(UITableViewCell).style { |st| st.background_color = rmq.color.clear }
  end

  def table_data
    @credit_table_data ||= [
      {
        title: "Share!",
        cells: [{
            title: 'Share the app',
            subtitle: 'Text, Email, Tweet, or Facebook!',
            image: 'share',
            action: :share
          }, {
            title: "Rate #{App.name} on iTunes",
            action: :rate_itunes,
            image: 'itunes'
          }]
      },{
        title: "Code",
        cells: [
          { title: "Written by Iconoclast Labs", action: :email_us},
          { title: "Code framework RedPotion", action: :view_page, arguments: { site: "http://clearsightstudio.github.io/ProMotion/"}},
          { title: "Language RubyMotion", action: :view_page, arguments: { site: "http://www.rubymotion.com/"}},
          { title: "View site and code", action: :view_page, arguments: { site: "http://iconoclastlabs.github.io/rubytrivia/"}}
        ]
      },{
        title: "Graphics",
        cells: [
          { title: "Background: SubtlePatterns.com", action: :view_page, arguments: { site: "http://subtlepatterns.com/retina-wood/"}},
          { title: "Icon Julien Deveaux : NounProject", action: :view_page, arguments: { site: "http://thenounproject.com/noun/ruby/#icon-No15720"}},
          { title: "Formatting with Teacup", action: :view_page, arguments: { site: "https://github.com/rubymotion/teacup"}}
        ]
      },{
        title: "Questions",
        cells: [
          { title: "Github gregstallings/ruby-trivia", action: :view_page, arguments: { site: "https://github.com/gregstallings/ruby-trivia"}},
          { title: "Configure Questions", action: :settings_modal}
        ]
      }
    ]

  end

  def will_appear
    view.backgroundView = nil # WAS NEEDED FOR iOS6
    set_attributes self.view, stylename: :trivia_view
  end

  def email_us
    mailto_link = "mailto:developers@iconoclastlabs.com".nsurl
    UIApplication.sharedApplication.openURL(mailto_link)
  end

  def view_page(args={})
    args[:site].nsurl.open
  end

  def settings_modal
    mp "Show Settings"
    open_modal SettingsScreen.new(nav_bar: true, trivia: @trivia)
  end

  def share
    BW::UIActivityViewController.new(
      items: "I'm using the #{App.name} app to learn more about Ruby. Check it out! http://iconoclastlabs.github.io/rubytrivia/",
      animated: true,
    ) do |activity_type, completed|
      # share completed
    end

  end

  def rate_itunes
    #https://github.com/arashpayan/appirater
    Appirater.rateApp
  end


end
