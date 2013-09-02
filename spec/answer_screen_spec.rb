describe "AnswerScreen" do
  tests AnswerScreen


  before do
    # Simulate AppDelegate setup of main screen
    @screen = AnswerScreen.new modal: true, nav_bar: true
    @screen.on_load
  end

  it "should store title" do
    AnswerScreen.get_title.should == 'Answer'
  end

  it "should set title when instantiated" do
    @screen.title.should == 'Answer'
  end

  it "should have a nav bar" do
    @screen.nav_bar?.should == true
  end

end