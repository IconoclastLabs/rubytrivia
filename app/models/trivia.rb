class Trivia
  attr_accessor :lines, :current_quip

  def initialize
    @current_quip = ""
    @lines = []
  end

  def next_line
    self.filter_quips if @lines.size < 1
    @current_quip = @lines.pop
  end

  def filter_quips
    @quips = self.seed_quips
    # Populate lines from live categories
    @lines = [] #make sure it's empty
    #$categories.live_list.each do |cat|
    #  @lines += @quips[cat]
    #end

    @lines.shuffle!
    @lines.push("No categories selected.") if @lines.empty?
    ap "Filtered Lines!"
  end

  def seed_quips
    ap "Seed quips called"
    seed_file = NSBundle.mainBundle.pathForResource('qa', ofType:'json')
    json_string = String.new(NSString.stringWithContentsOfFile(seed_file))
    BW::JSON.parse(json_string)
  end

end