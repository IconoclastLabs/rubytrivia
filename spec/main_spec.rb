describe "Application" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has at least 1 window" do
    @app.windows.size.should >= 1
  end
end
