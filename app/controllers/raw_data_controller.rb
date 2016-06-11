class RawDataController < ApplicationController
  # GET /raw_data
  # GET /raw_data.xml
  def index
    @raw_data = RawDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @raw_data }
    end
  end

  # GET /raw_data/1
  # GET /raw_data/1.xml
  def show
    @raw_datum = RawDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @raw_datum }
    end
  end

  # GET /raw_data/new
  # GET /raw_data/new.xml
  def new
    @raw_datum = RawDatum.new
    @raw_data = RawDatum.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @raw_datum }
    end
  end

  # GET /raw_data/1/edit
  def edit
    @raw_datum = RawDatum.find(params[:id])
  end

  # POST /raw_data
  # POST /raw_data.xml
  def create
    @raw_data = RawDatum.all
    @raw_datum = RawDatum.new(params[:raw_datum])

    respond_to do |format|
      if @raw_datum.save
        #format.html { render :action => "new", :notice => 'Raw datum was successfully created.' }
        format.html { redirect_to action: 'new' }
        format.xml  { render :xml => @raw_datum, :status => :created, :location => @raw_datum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @raw_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /raw_data/1
  # PUT /raw_data/1.xml
  def update
    @raw_datum = RawDatum.find(params[:id])

    respond_to do |format|
      if @raw_datum.update_attributes(params[:raw_datum])
        format.html { redirect_to(@raw_datum, :notice => 'Raw datum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @raw_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_data/1
  # DELETE /raw_data/1.xml
  def destroy
    @raw_datum = RawDatum.find(params[:id])
    @raw_datum.destroy

    respond_to do |format|
      format.html { redirect_to(raw_data_url) }
      format.xml  { head :ok }
    end
  end
end
