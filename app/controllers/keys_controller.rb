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

class KeysController < ApplicationController
  # GET /keys
  # GET /keys.xml
  def index
    @keys = Key.find(:all, :order => "description")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @keys }
    end
  end

  # GET /keys/1
  # GET /keys/1.xml
  def show
    @key = Key.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @key }
    end
  end

  # GET /keys/new
  # GET /keys/new.xml
  def new
    @key = Key.new
	@keytype = Keytype.find(:all, :order => "name")
	@keyway = Keyway.find(:all, :order => "name")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @key }
    end
  end

  # GET /keys/1/edit
  def edit
    @key = Key.find(params[:id])
	@keytype = Keytype.find(:all, :order => "name")
	@keyway = Keyway.find(:all, :order => "name")
  end

  # POST /keys
  # POST /keys.xml
  def create
    @key = Key.new(params[:key])
	@keytype = Keytype.find(:all, :order => "name")
	@keyway = Keyway.find(:all, :order => "name")

    respond_to do |format|
      if @key.save
        format.html { redirect_to(@key, :notice => 'Key was successfully created.') }
        format.xml  { render :xml => @key, :status => :created, :location => @key }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @key.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /keys/1
  # PUT /keys/1.xml
  def update
    @key = Key.find(params[:id])
	@keytype = Keytype.find(:all, :order => "name")
	@keyway = Keyway.find(:all, :order => "name")

    respond_to do |format|
      if @key.update_attributes(params[:key])
        format.html { redirect_to(@key, :notice => 'Key was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @key.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /keys/1
  # DELETE /keys/1.xml
  def destroy
    @key = Key.find(params[:id])
    @key.destroy

    respond_to do |format|
      format.html { redirect_to(keys_url) }
      format.xml  { head :ok }
    end
  end
end
