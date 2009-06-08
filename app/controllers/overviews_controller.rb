class OverviewsController < ApplicationController
  # GET /overviews
  # GET /overviews.xml
  def index
    @overviews = Overview.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @overviews }
    end
  end

  # GET /overviews/1
  # GET /overviews/1.xml
  def show
    @overview = Overview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @overview }
    end
  end

  # GET /overviews/new
  # GET /overviews/new.xml
  def new
    @overview = Overview.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @overview }
    end
  end

  # GET /overviews/1/edit
  def edit
    @overview = Overview.find(params[:id])
  end

  # POST /overviews
  # POST /overviews.xml
  def create
    @overview = Overview.new(params[:overview])

    respond_to do |format|
      if @overview.save
        flash[:notice] = 'Overview was successfully created.'
        format.html { redirect_to(@overview) }
        format.xml  { render :xml => @overview, :status => :created, :location => @overview }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @overview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /overviews/1
  # PUT /overviews/1.xml
  def update
    @overview = Overview.find(params[:id])

    respond_to do |format|
      if @overview.update_attributes(params[:overview])
        flash[:notice] = 'Overview was successfully updated.'
        format.html { redirect_to(@overview) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @overview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /overviews/1
  # DELETE /overviews/1.xml
  def destroy
    @overview = Overview.find(params[:id])
    @overview.destroy

    respond_to do |format|
      format.html { redirect_to(overviews_url) }
      format.xml  { head :ok }
    end
  end
end
