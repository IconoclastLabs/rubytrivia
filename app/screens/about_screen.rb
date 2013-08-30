class AboutScreen < PM::GroupedTableScreen
  stylesheet :question_stylesheet

  title "About"

  def table_data
    @credit_table_data ||= [
      {
        title: "Code",
        cells: [
          { title: "Written by Iconoclast Labs", action: :contact_us},
          { title: "Code framework ProMotion"},
          { title: "Language RubyMotion"},
          { title: "View app code on Github"}
        ]
      },{
        title: "Graphics",
        cells: [
          { title: "Background: SubtlePatterns.com"},
          { title: "Icon: Julien Deveaux NounProject"}
        ]
      },{
        title: "Questions",
        cells: [
          { title: "Github gregstallings/ruby-trivia"}
        ]
      }
    ]

  end

  def on_load
    # clear out the normal striped background
    self.view.backgroundView = nil 
    set_attributes self.view, stylename: :question_view
  end

  private

    def email_us
      mailto_link = "mailto:developers@iconoclastlabs.com".nsurl
      UIApplication.sharedApplication.openURL(mailto_link)
    end
       
    def on_return(args={})
      PM.logger.info args
    end
  
end
