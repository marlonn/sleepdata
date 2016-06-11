# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sleepdata::Application.initialize!

#require "lib/String.rb"

# class String
#   def holiday? # on timestamp as string
#
#     if Holiday.where(date: Date.parse(self)).any?
#       true
#     else
#       false
#     end
#
#   end
# end
