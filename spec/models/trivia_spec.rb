describe "Trivia" do
  @trivia = Trivia.new

  it "keeps track of it's current quip" do
    @trivia.should.respond_to?(:current_quip)
  end

  it "can't have the current quip changeable" do
    lambda { @trivia.current_quip = "taco" }.
      should.raise(NoMethodError)
  end

  it "stores everythinin App::Persistence['trivia']" do
    App::Persistence['trivia'].should == @trivia.instance_variable_get("@quips")
  end

  it "changes and returns current_quip on next" do
    old = @trivia.current_quip
    quip = @trivia.next
    @trivia.current_quip.should == quip
    quip.should.not == old
  end

  it "changes and returns current_quip on previous" do
    old = @trivia.current_quip
    quip = @trivia.previous
    @trivia.current_quip.should == quip
    quip.should.not == old

  end

  it "current_quip is the same value if you next then previous" do
    old = @trivia.current_quip
    quip = @trivia.next
    @trivia.previous
    @trivia.current_quip.should == old
    quip.should.not == old
  end

  it "lists categories based on the .json keys" do
    quips = @trivia.instance_variable_get("@quips")
    quips.keys.sort.should == @trivia.categories
  end

  it "can download the updated json file from github" do
    result = @trivia.perform_update
    wait 5.0 do
      result.should.not == false
    end
  end

end