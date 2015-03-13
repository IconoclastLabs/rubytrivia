class AppDelegate < PM::Delegate
  status_bar false, animation: :none

  def on_load(app, options)
    Appirater.setAppId 703147133
    open QuestionScreen.new(nav_bar: true)
    Appirater.appLaunched(true) unless Device.simulator?
  end

end
