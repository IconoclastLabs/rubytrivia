describe "HelpScreen" do
  tests HelpScreen

  before do
    # Simulate AppDelegate setup of main screen
    @screen = HelpScreen.new modal: true, nav_bar: true
    @screen.will_appear
  end

  it "should set title when instantiated" do
    @screen.title.should == 'Help'
  end

  it "should have a nav bar" do
    @screen.nav_bar?.should == true
  end

  it "should have a left bar button item" do
    @screen.navigationItem.leftBarButtonItem.should.not == nil
  end

end