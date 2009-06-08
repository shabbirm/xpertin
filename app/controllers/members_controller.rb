class MembersController < ApplicationController
  layout 'member'
   # GET /pages
  # GET /pages.xml
  def index
    @members = Member.find(:all)
    @members = Member.paginate :page => params[:page], :per_page => 5

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @member = Member.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /pages/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
     @member = Member.new(params[:member])
     if simple_captcha_valid?
        successful= @member.save 
     else  
        successful= false
     end  
    respond_to do |format|
      if successful
        flash[:notice] = 'Member was successfully created.'
        format.html { redirect_to(@member) }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        flash[:notice] = "image and text were different."
        format.html { render :action => "new"}
        #format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:page])
        flash[:notice] = 'Member was successfully updated.'
        format.html { redirect_to(@member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
    end
  end
end
