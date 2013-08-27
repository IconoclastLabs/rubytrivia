# Gonna have to switch this to formotion https://github.com/clayallsopp/formotion
class SettingsScreen < PM::FormotionScreen
  attr_accessor :trivia
  title "Settings"

  # when 14 question categories are live, this crashes...!?
  def table_data
    @help_table_data ||= 
    {
      persist_as: :settings,
      sections: [{ 
        title: "Question Categories",
          rows: category_rows
      },{ 
        title: "Credits",
          rows: [
            { title: "Code by Iconoclast Labs", key: :us, type: :static},
            { title: "Questions via Github ruby-trivia", key: :questions, type: :static },
            { title: "Background: SubtlePatterns.com", key: :credit, type: :static},
            { title: "Icon: Julien Deveaux - Noun Project", key: :icon, type: :static}
          ]
      }]
    }

  end

  def on_load
    # If the next line is commented out, this crashes! wat!?
    $form = self.form

    self.form.row(:us).on_tap do |row|
      email_us
    end
  end

  private

    # Crashes when more than 14 are allowed
    # significantly slows everything down when more than 10
    def category_rows
      all_categories = []
      @trivia.categories.each do |category|
        all_categories << {
          title: category,
          key: clean_symbol(category),
          type: :switch,
          value: true
        } if all_categories.size < 7
      end
      all_categories
    end

    def clean_symbol string
      #only word characters, lowercased
      string.gsub(/\W+/, "").downcase.to_sym
    end

    def email_us
      mailto_link = "mailto:developers@iconoclastlabs.com".nsurl
      UIApplication.sharedApplication.openURL(mailto_link)
    end
    
    def modal_tapped
      open_modal HelpScreen.new(nav_bar: true)
    end
    
    def on_return(args={})
      PM.logger.info args
    end
  
end
