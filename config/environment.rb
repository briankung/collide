# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Collide::Application.initialize!

# BK: Adds controller MIME type
Mime::Type.register "text/rb", :rb