class ImplementationsController < ApplicationController
  load_and_authorize_resource
  
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @implementation.save
        format.html { redirect_to implementations_url, notice: 'Implementation was successfully added.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @implementation.update_attributes(params[:implementation])
        format.html { redirect_to @implementation, notice: 'Implementation was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @implementation.destroy

    respond_to do |format|
      format.html { redirect_to implementations_url }
    end
  end
end
