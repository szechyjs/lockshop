class KeytypesController < ApplicationController
  # GET /keytypes
  # GET /keytypes.xml
  def index
    @keytypes = Keytype.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @keytypes }
    end
  end

  # GET /keytypes/1
  # GET /keytypes/1.xml
  def show
    @keytype = Keytype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @keytype }
    end
  end

  # GET /keytypes/new
  # GET /keytypes/new.xml
  def new
    @keytype = Keytype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @keytype }
    end
  end

  # GET /keytypes/1/edit
  def edit
    @keytype = Keytype.find(params[:id])
  end

  # POST /keytypes
  # POST /keytypes.xml
  def create
    @keytype = Keytype.new(params[:keytype])

    respond_to do |format|
      if @keytype.save
        format.html { redirect_to(@keytype, :notice => 'Keytype was successfully created.') }
        format.xml  { render :xml => @keytype, :status => :created, :location => @keytype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @keytype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /keytypes/1
  # PUT /keytypes/1.xml
  def update
    @keytype = Keytype.find(params[:id])

    respond_to do |format|
      if @keytype.update_attributes(params[:keytype])
        format.html { redirect_to(@keytype, :notice => 'Keytype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @keytype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /keytypes/1
  # DELETE /keytypes/1.xml
  def destroy
    @keytype = Keytype.find(params[:id])
    @keytype.destroy

    respond_to do |format|
      format.html { redirect_to(keytypes_url) }
      format.xml  { head :ok }
    end
  end
end
