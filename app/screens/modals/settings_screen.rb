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
    # clear out the normal striped background
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

  def on_load
    # https://github.com/clayallsopp/formotion/blob/master/lib/formotion/form/form.rb#L25
    # This should go away as soon as this pull request is bubbled up to RubyGems.org
    # https://github.com/clayallsopp/formotion/commit/344fb73e6b5a64f3dabffba1d78791e9674b0244
    self.form.open
    self.form.init_observer_for_save
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