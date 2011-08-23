# LockShop - SFIC lock management
# Copyright (C) 2011  Jared Szechy
#
# LockShop is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# LockShop is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with LockShop.  If not, see <http://www.gnu.org/licenses/>.

class CoresController < ApplicationController
  before_filter :authenticate_user!
  
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
