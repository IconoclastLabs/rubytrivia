describe "QuestionScreen" do
  tests QuestionScreen

  # Simulate AppDelegate setup of main screen
  @screen = QuestionScreen.new nav_bar: true
  @screen.will_appear

  it "stores title" do
    QuestionScreen.get_title.should == 'Ruby Trivia'
  end

  it "sets title when instantiated" do
    @screen.title.should == 'Ruby Trivia'
  end

  it "has a nav bar" do
    @screen.nav_bar?.should == true
  end

  it "has a right bar button item" do
    @screen.navigationItem.rightBarButtonItem.should.not == nil
  end

  it "has a left bar button item" do
    @screen.navigationItem.leftBarButtonItem.should.not == nil
  end

  it "has theme styles" do
    Teacup::Stylesheet[:trivia_stylesheet].should.not == nil
    Teacup::Stylesheet[:base_stylesheet].should.not == nil
  end
end