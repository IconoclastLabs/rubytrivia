class Trivia
  attr_accessor :lines, :current_quip

  def initialize
    @current_quip = {}
    @lines = []
    @quips = self.seed_quips
  end

  def next_line
    self.filter_quips if @lines.size < 1
    @current_quip = @lines.pop
    @current_quip["question"]
  end

  def filter_quips
    # Populate lines from live categories
    @lines = [] #make sure it's empty

    #$junk = @quips
    # $categories.live_list.each do |cat|
    #   @lines += @quips[cat]
    # end

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