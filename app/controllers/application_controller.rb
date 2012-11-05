class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_voteable

private
	
	def load_voteable
		resource, id = request.path.split('/')[1, 2]
		@voteable = resource.singularize.classify.constantize.find(id) if id =~ /\d/
	end
end
