class CommentsController < ApplicationController
	load_and_authorize_resource

  def create
    @comment = @commentable.comments.new(params[:comment].merge({hero_id: current_hero.id}))
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

end