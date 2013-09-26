class AboutScreen < PM::GroupedTableScreen
  stylesheet :trivia_stylesheet
  attr_accessor :trivia
  title "About"

  def table_data
    @credit_table_data ||= [
      {
        title: "Code",
        cells: [
          { title: "Written by Iconoclast Labs", action: :email_us},
          { title: "Code framework ProMotion", action: :view_page, arguments: { site: "http://clearsightstudio.github.io/ProMotion/"}},
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
          { title: "GitHub gregstallings/ruby-trivia", action: :view_page, arguments: { site: "https://github.com/gregstallings/ruby-trivia"}},
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
    ap "Show Settings"
    open_modal SettingsScreen.new(nav_bar: true, trivia: @trivia)
  end


end
