class ConceptsController < ApplicationController
  def index
    @concepts = Concept.all

    respond_to do |format|
      format.html # index.html.erb
      # BK: This is kinda ghetto. I don't even know why I put this in here.
      # BK: Proof of concept?
      # format.rb { @controller_src = File.open(__FILE__) } 
    end
  end

  def show
    @concept = Concept.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @concept = Concept.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @concept = Concept.find(params[:id])
  end

  def create
    @concept = Concept.new(params[:concept])

    respond_to do |format|
      if @concept.save
        format.html { redirect_to concepts_url, notice: 'Concept was successfully added.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @concept = Concept.find(params[:id])

    respond_to do |format|
      if @concept.update_attributes(params[:concept])
        format.html { redirect_to @concept, notice: 'Concept was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy

    respond_to do |format|
      format.html { redirect_to concepts_url }
    end
  end
end
