class AppDelegate < PM::Delegate
  
  status_bar false, animation: :none

  def on_load(app, options)
    open QuestionScreen.new(nav_bar: true)
  end
  
end
