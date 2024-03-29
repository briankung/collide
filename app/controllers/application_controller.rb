class ApplicationController < ActionController::Base
  before_filter :load_commentable
  protect_from_forgery

  # CanCan Stuff

  # BK: Adds support for current_hero to cancan instead of current_user
  def current_ability
  	@current_ability ||= Ability.new(current_hero)
  end

  # BK: The request object is super neat. This redirects to the referring URL.
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to request.referrer, :alert => exception.message 
  end

private
  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id) if id =~ /\d/
  end
end
