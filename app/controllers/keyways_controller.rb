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
	
class KeywaysController < ApplicationController
  # GET /keyways
  # GET /keyways.xml
  def index
    @keyways = Keyway.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @keyways }
    end
  end

  # GET /keyways/1
  # GET /keyways/1.xml
  def show
    @keyway = Keyway.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @keyway }
    end
  end

  # GET /keyways/new
  # GET /keyways/new.xml
  def new
    @keyway = Keyway.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @keyway }
    end
  end

  # GET /keyways/1/edit
  def edit
    @keyway = Keyway.find(params[:id])
  end

  # POST /keyways
  # POST /keyways.xml
  def create
    @keyway = Keyway.new(params[:keyway])

    respond_to do |format|
      if @keyway.save
        format.html { redirect_to(@keyway, :notice => 'Keyway was successfully created.') }
        format.xml  { render :xml => @keyway, :status => :created, :location => @keyway }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @keyway.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /keyways/1
  # PUT /keyways/1.xml
  def update
    @keyway = Keyway.find(params[:id])

    respond_to do |format|
      if @keyway.update_attributes(params[:keyway])
        format.html { redirect_to(@keyway, :notice => 'Keyway was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @keyway.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /keyways/1
  # DELETE /keyways/1.xml
  def destroy
    @keyway = Keyway.find(params[:id])
    @keyway.destroy

    respond_to do |format|
      format.html { redirect_to(keyways_url) }
      format.xml  { head :ok }
    end
  end
end
