describe "QuestionScreen" do
  tests QuestionScreen

  before do
    # Simulate AppDelegate setup of main screen
    @screen = QuestionScreen.new modal: true, nav_bar: true
    @screen.will_appear
  end

  it "should store title" do
    QuestionScreen.get_title.should == 'Ruby Trivia'
  end

  it "should set title when instantiated" do
    @screen.title.should == 'Ruby Trivia'
  end

  it "should have a nav bar" do
    @screen.nav_bar?.should == true
  end

  it "have a right bar button item" do
    @screen.navigationItem.rightBarButtonItem.should.not == nil
  end

  it "should have a left bar button item" do
    @screen.navigationItem.leftBarButtonItem.should.not == nil
  end
end