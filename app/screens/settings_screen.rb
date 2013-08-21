# Gonna have to switch this to formotion https://github.com/clayallsopp/formotion
class SettingsScreen < PM::GroupedTableScreen
  title "Settings"

  def table_data
    @help_table_data ||= [{ 
      title: "Question Categories",
        cells: [
          { title: "Category1"},
          { title: "Category2"}
        ]
    },{ 
      title: "Credits",
        cells: [
          { title: "Programming: Iconoclast Labs", action: :email_us },
          { title: "Questions: via Github ruby-trivia" },
          { title: "Background: SubtlePatterns.com"},
          { title: "Help", action: :modal_tapped}
        ]
    }]
  end

  def email_us
    mailto_link = NSURL.URLWithString("mailto:developers@iconoclastlabs.com")
    UIApplication.sharedApplication.openURL(mailto_link)
  end
  
  def modal_tapped
    open_modal ModalScreen.new(nav_bar: true)
  end
  
  def on_return(args={})
    PM.logger.info args
  end
  
end
