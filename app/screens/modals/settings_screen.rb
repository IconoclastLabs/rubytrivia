class SettingsScreen < PM::FormotionScreen
  stylesheet :trivia_stylesheet
  attr_accessor :trivia
  title "Settings"

  def will_appear
    @view_is_set_up ||= set_up_view
  end
  
  def set_up_view
    set_attributes self.view, stylename: :trivia_view
    set_nav_bar_button :left, title: "Close", action: :close_modal_tapped
    # clear out the normal striped background for iOS6
    self.view.backgroundView = nil 
    set_attributes self.view, stylename: :trivia_view
    true
  end

  def table_data 
    {
      title: "Settings",
      persist_as: :settings,
      sections: [{ 
        title: "Question Categories",
          rows: category_rows
      }]
    }
  end

  def will_disappear
    @trivia.filter_quips
  end

  private

    def category_rows
      all_categories = []
      @trivia.categories.each do |category|
        all_categories << {
          title: category,
          key: @trivia.clean_symbol(category),
          type: :switch,
          value: true
        }
      end
      all_categories
    end

    def close_modal_tapped
      close
    end


  
end