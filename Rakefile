# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "rubygems"
require 'bundler'
Bundler.require

require './app_properties'
props = AppProperties.new


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = props.name
  app.deployment_target = props.deployment_target
  app.identifier = props.identifier

  app.version = props.app_version
  app.short_version = props.app_version #required to be incremented for AppStore (http://iconoclastlabs.com/cms/blog/posts/updating-a-rubymotion-app-store-submission)
  app.device_family = props.devices
  #app.icons = props.icons
  app.provisioning_profile = './Ruby_Trivia.mobileprovision'
  app.codesign_certificate = 'iPhone Distribution: Iconoclast Labs LLC'
  # app.release do
  #   app.codesign_certificate = props.distribution_certificate
  # end
  # app.development do
  #   app.codesign_certificate = props.developer_certificate
  # end
  app.frameworks += props.frameworks
  app.prerendered_icon = props.prerendered_icon
  app.interface_orientations = [:portrait, :landscape_left, :landscape_right]

  app.redgreen_style = :full # default: :focused
end