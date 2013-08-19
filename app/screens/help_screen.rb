class HelpScreen < PM::GroupedTableScreen
  title "Help"

  def table_data
    @help_table_data ||= [{
      title: "Settings for stuff",
      cells: [{
        title: "Email us", action: :email_us,
        title: "Open Modal", action: :modal_tapped
      }]
    }]
  end

  def email_us
    mailto_link = NSURL.URLWithString("mailto:jamon@clearsightstudio.com")
    UIApplication.sharedApplication.openURL(mailto_link)
  end
  
  def modal_tapped
    open_modal ModalScreen.new(nav_bar: true)
  end
  
  def on_return(args={})
    PM.logger.info args
  end
  
end
