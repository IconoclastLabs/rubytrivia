class Trivia
  attr_reader :current_quip

  def initialize
    @current_quip = {"answer"=>"Begin swiping to get started!", "question"=>"Welcome to Ruby Trivia!"}
    #App::Persistence['trivia'] = seed_quips
    @quips = seed_quips
    @current_position = 0
    load_lines
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

  def seed_quips
    json_string = ""
    unless json_string = MotionConcierge.local_file_string
      mp "My data came from the local copy"
      seed_file = NSBundle.mainBundle.pathForResource('qa', ofType:'json')
      json_string = String.new(NSString.stringWithContentsOfFile(seed_file))
    end
    BW::JSON.parse(json_string)
  end

  def load_lines
    @lines = []

    categories.each do |cat|
      @lines += @quips[cat]
    end

    @lines.shuffle!
    mp "#{@lines.size} Questions ready to go!"
  end

  def categories
    @quips.keys.sort
  end

  def clean_symbol string
    #only word characters, lowercased
    string.gsub(/\W+/, "").downcase.to_sym
  end

end