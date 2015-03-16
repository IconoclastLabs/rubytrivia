describe "AnswerScreen" do
  tests AnswerScreen

  before do
    # Simulate AppDelegate setup of main screen
    @screen = AnswerScreen.new modal: true, nav_bar: true, answer: "Test Answer"
  end

  it "sets title when instantiated" do
    @screen.title.should == 'Answer'
  end

  it "has a nav bar" do
    @screen.nav_bar?.should == true
  end


end