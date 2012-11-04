class CodesController < ApplicationController
  def index
    @codes = Code.all

    respond_to do |format|
      format.html # index.html.erb
      format.rb { @controller_src = File.open(__FILE__) }
    end
  end

  def show
    @code = Code.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @code = Code.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @code = Code.find(params[:id])
  end

  def create
    @code = Code.new(params[:code])

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @code = Code.find(params[:id])

    respond_to do |format|
      if @code.update_attributes(params[:code])
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @code = Code.find(params[:id])
    @code.destroy

    respond_to do |format|
      format.html { redirect_to codes_url }
    end
  end
end
