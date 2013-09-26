class AppProperties
  VERSION = '1.1'
  SKU_NAME = 'rubytrivia' #default
  COMPANY_NAME = 'com.iconoclastlabs.'
  
  def name
    'Ruby Trivia'
  end

  def self.version
    VERSION
  end

  def app_version
    VERSION
  end

  def frameworks
    []
  end

  def contributors
    ["Gant Laborde", "Matt Garrison"]
  end

  def developer_certificate
    "iPhone Developer: Gant Laborde (56HAJP2GEQ)" #"iPhone Developer: Matt Garrison (EUS6PB7N8V)"
  end

  def distribution_certificate
    "iPhone Distribution: Iconoclast Labs LLC"
  end

  def provisioning
    './provisioning' #symlink is custom to each user's machine
  end

  def deployment_target
    '6.0'
  end


  def delegate
    'app_delegate'
  end

  def prerendered_icon
    false 
  end

  def devices
    [:iphone]
  end

  def identifier
    COMPANY_NAME + SKU_NAME
  end

  def description
    %W[
      A basic flashcard app for Ruby trivia questions.
    ]
  end
end
