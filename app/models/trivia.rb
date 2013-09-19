class Trivia
  attr_reader :current_quip

  def initialize
    @current_quip = {"answer"=>"Begin swiping to get started!", "question"=>"Welcome to Ruby Trivia!"}
    App::Persistence['trivia'] ||= self.seed_quips
    @quips = App::Persistence['trivia'].dup
    @current_position = 0
    filter_quips
    perform_update
  end

  def previous
    @current_position = (@current_position - 1) % @lines.size
    @current_quip = @lines[@current_position.abs]
  end

  def next
    # iterate, but wrap around when you hit size
    @current_position = (@current_position + 1) % @lines.size
    @current_quip = @lines[@current_position]
  end

  def filter_quips
    # Populate lines from live categories
    @lines = [] #make sure it's empty
    cat_settings = App::Persistence["FORMOTION_settings"]

    # If settings have been modified, use those; otherwise just add all questions
    categories.each do |cat|
      if cat_settings
        @lines += @quips[cat] if cat_settings[clean_symbol(cat)]
      else
        @lines += @quips[cat]
      end
    end

    @lines.shuffle!
    @lines.push({"answer"=>"Click on About -> Settings!", "question"=>"No Categories Selected"}) if @lines.empty?
    ap "Filtered Lines! Count = #{@lines.size}"
  end

  def seed_quips
    ap "Seed quips called"
    seed_file = NSBundle.mainBundle.pathForResource('qa', ofType:'json')
    json_string = String.new(NSString.stringWithContentsOfFile(seed_file))
    BW::JSON.parse(json_string)
  end

  def categories
    @quips.keys.sort
  end

  def perform_update
    ap "downloading update"
    BW::HTTP.get("https://raw.github.com/IconoclastLabs/rubytrivia/master/resources/qa.json") do |response|
      if response.ok?
        ap "Download complete and ok. Now setting it to the new file"
        App::Persistence['trivia'] = BW::JSON.parse(response.body.to_str)
      else
        ap "Download Failed: #{response.error_message}"
        false
      end
    end

  end

  def clean_symbol string
    #only word characters, lowercased
    string.gsub(/\W+/, "").downcase.to_sym
  end

end