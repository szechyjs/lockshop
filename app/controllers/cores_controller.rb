class CoresController < ApplicationController
  # GET /cores
  # GET /cores.xml
  def index
    @cores = Core.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cores }
    end
  end

  # GET /cores/1
  # GET /cores/1.xml
  def show
    @core = Core.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @core }
    end
  end

  # GET /cores/new
  # GET /cores/new.xml
  def new
    @core = Core.new
	@change = Key.find(:all, :conditions => { :keytype_id => ["4"] }, :order => "name")
	@control = Key.find(:all, :conditions => { :keytype_id => ["2"] }, :order => "name")
	@keyway = Keyway.find(:all, :order => "name")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @core }
    end
  end

  # GET /cores/1/edit
  def edit
    @core = Core.find(params[:id])
	@change = Key.find(:all, :conditions => { :keytype_id => ["4"] }, :order => "name")
	@control = Key.find(:all, :conditions => { :keytype_id => ["2"] }, :order => "name")
	@keyway = Keyway.find(:all, :order => "name")
  end

  # POST /cores
  # POST /cores.xml
  def create
    @core = Core.new(params[:core])
	@change = Key.find(:all, :conditions => { :keytype_id => ["4"] }, :order => "name")
	@control = Key.find(:all, :conditions => { :keytype_id => ["2"] }, :order => "name")
	@keyway = Keyway.find(:all, :order => "name")

    respond_to do |format|
      if @core.save
        format.html { redirect_to(@core, :notice => 'Core was successfully created.') }
        format.xml  { render :xml => @core, :status => :created, :location => @core }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @core.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cores/1
  # PUT /cores/1.xml
  def update
    @core = Core.find(params[:id])
	@change = Key.find(:all, :conditions => { :keytype_id => ["4"] }, :order => "name")
	@control = Key.find(:all, :conditions => { :keytype_id => ["2"] }, :order => "name")
	@keyway = Keyway.find(:all, :order => "name")

    respond_to do |format|
      if @core.update_attributes(params[:core])
        format.html { redirect_to(@core, :notice => 'Core was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @core.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cores/1
  # DELETE /cores/1.xml
  def destroy
    @core = Core.find(params[:id])
    @core.destroy

    respond_to do |format|
      format.html { redirect_to(cores_url) }
      format.xml  { head :ok }
    end
  end
  
  def update_controls
    control = Key.find(:all, :conditions => { :keytype_id => ["2"], :keyway_id => params[:keyway_id] }, :order => "name")
    render :update do |page|
	  page.replace_html 'controls', :partial => 'controls', :object => control
	end
  end
end
