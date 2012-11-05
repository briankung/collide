class ImplementationsController < ApplicationController
  def index
    @implementations = Implementation.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @implementation = Implementation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @implementation = Implementation.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @implementation = Implementation.find(params[:id])
  end

  def create
    @implementation = Implementation.new(params[:implementation])

    respond_to do |format|
      if @implementation.save
        format.html { redirect_to implementations_url, notice: 'Implementation was successfully added.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @implementation = Implementation.find(params[:id])

    respond_to do |format|
      if @implementation.update_attributes(params[:implementation])
        format.html { redirect_to @implementation, notice: 'Implementation was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @implementation = Implementation.find(params[:id])
    @implementation.destroy

    respond_to do |format|
      format.html { redirect_to implementations_url }
    end
  end
end
