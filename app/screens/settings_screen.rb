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
          rows: #category_rows
            [
              {:title=>"Blocks and Iterators", :key=>:blocksanditerators, :type=>:switch, :value=>true},
              {:title=>"Classes", :key=>:classes, :type=>:switch, :value=>true}, 
              {:title=>"Closures", :key=>:closures, :type=>:switch, :value=>true}, 
              {:title=>"Constants", :key=>:constants, :type=>:switch, :value=>true}, 
              {:title=>"Control Structures", :key=>:controlstructures, :type=>:switch, :value=>true}, 
              {:title=>"Data Types", :key=>:datatypes, :type=>:switch, :value=>true}, 
              {:title=>"Debugging", :key=>:debugging, :type=>:switch, :value=>true}, 
              {:title=>"Exceptions", :key=>:exceptions, :type=>:switch, :value=>true}, 
              #{:title=>"Inheritance", :key=>:inheritance, :type=>:switch, :value=>true},
              {:title=>"Language Characteristics and Core Objects", :key=>:languagecharacteristicsandcoreobjects, :type=>:switch, :value=>true}, 
              {:title=>"Loading Modules, Files, and Gems", :key=>:loadingmodulesfilesandgems, :type=>:switch, :value=>true}, 
              {:title=>"Metaprogramming", :key=>:metaprogramming, :type=>:switch, :value=>true}, 
              {:title=>"Method Objects", :key=>:methodobjects, :type=>:switch, :value=>true}, 
              #{:title=>"Methods", :key=>:methods, :type=>:switch, :value=>true}, 
              #{:title=>"Modules", :key=>:modules, :type=>:switch, :value=>true}, 
              # {:title=>"Operators", :key=>:operators, :type=>:switch, :value=>true}, 
              # {:title=>"Procs and Lambdas", :key=>:procsandlambdas, :type=>:switch, :value=>true}, 
              {:title=>"Security", :key=>:security, :type=>:switch, :value=>true}, 
              # {:title=>"Structs", :key=>:structs, :type=>:switch, :value=>true}, 
              #{:title=>"The Ruby Environment and the Interpreter", :key=>:therubyenvironmentandtheinterpreter, :type=>:switch, :value=>true}
            ]
      },{ 
        title: "Credits",
          rows: [
            { title: "Code by Iconoclast Labs", key: :us, type: :static},
            { title: "Questions via Github ruby-trivia", key: :questions, type: :static },
            { title: "Background: SubtlePatterns.com", key: :credit, type: :static}
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

    def category_rows
      all_categories = []
      @trivia.categories.each do |category|
        all_categories << {
          title: category,
          key: category.downcase.to_sym,
          type: :switch,
          value: true
        }
      end
      all_categories
    end

    def email_us
      mailto_link = "mailto:developers@iconoclastlabs.com".nsurl
      UIApplication.sharedApplication.openURL(mailto_link)
    end
    
    def modal_tapped
      open_modal ModalScreen.new(nav_bar: true)
    end
    
    def on_return(args={})
      PM.logger.info args
    end
  
end
