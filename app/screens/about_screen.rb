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
          { title: "Code framework ProMotion"},
          { title: "Language RubyMotion"},
          { title: "View app code on Github"}
        ]
      },{
        title: "Graphics",
        cells: [
          { title: "Background: SubtlePatterns.com"},
          { title: "Icon Julien Deveaux : NounProject"},
          { title: "Formatting with Teacup"}
        ]
      },{
        title: "Questions",
        cells: [
          { title: "Github gregstallings/ruby-trivia"},
          { title: "Configure Questions", action: :settings_modal}
        ]
      }
    ]

  end

  def on_load
    # clear out the normal striped background
    $junk = self
    self.view.backgroundView = nil 
    set_attributes self.view, stylename: :trivia_view
  end

  def email_us
    mailto_link = "mailto:developers@iconoclastlabs.com".nsurl
    UIApplication.sharedApplication.openURL(mailto_link)
  end

  def settings_modal
    ap "Show Settings"
    open_modal SettingsScreen.new(nav_bar: true, trivia: @trivia)
  end
       
end
