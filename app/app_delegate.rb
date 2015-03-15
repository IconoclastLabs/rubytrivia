class AppDelegate < PM::Delegate
  status_bar false, animation: :none

  def on_load(app, options)
    Appirater.setAppId 703147133

    # Set up motion-concierge
    MotionConcierge.local_file_name = 'qa.json'
    MotionConcierge.remote_file_url = 'https://raw.github.com/IconoclastLabs/rubytrivia/master/resources/qa.json'
    MotionConcierge.fetch_interval = 86400 # Once a day

    # Open the needed screen
    open QuestionScreen.new(nav_bar: true)

    Appirater.appLaunched(true) unless Device.simulator?
  end


  # Check for the data each time the app is launched
  def applicationDidBecomeActive(application)
      # Check for new data is necessary
      MotionConcierge.fetch
  end

end
