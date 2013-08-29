class Trivia
  attr_accessor :current_quip

  def initialize
    @current_quip = {"answer"=>"Let's get it started!"}
    @quips = self.seed_quips
    @current_position = 0
    filter_quips
  end

  def next
    # iterate, but wrap around when you hit size
    @current_position = @current_position + 1 % @lines.size
    @current_quip = @lines[@current_position]
  end

  def filter_quips
    # Populate lines from live categories
    @lines = [] #make sure it's empty

    categories.each do |cat|
      @lines += @quips[cat]
    end

    @lines.shuffle!
    @lines.push({"answer"=>"Click on Settings!.", "question"=>"No Categories Selected"}) if @lines.empty?
    ap "Filtered Lines!"
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

end