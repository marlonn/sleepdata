class ProcessedDataController < ApplicationController
  include ActionView::Helpers::NumberHelper

  # GET /processed_data
  # GET /processed_data.xml
  def index
    #@data = ProcessedDatum.all
    #@data = RawDatum.process_raw_data
    if ProcessedDatum.count == 0
      RawDatum.process_raw_data
      @data = ProcessedDatum.all
    elsif ProcessedDatum.count != 0
      if Time.parse(ProcessedDatum.first.begin) < (Time.parse(RawDatum.first.timestamp) - 1.day)
        RawDatum.process_raw_data
        @data = ProcessedDatum.all
      else
        @data = ProcessedDatum.all
      end
    end
  end

  # GET /processed_data/1
  # GET /processed_data/1.xml
  def show
    @processed_datum = ProcessedDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @processed_datum }
    end
  end

  # GET /processed_data/new
  # GET /processed_data/new.xml
  def new
    @processed_datum = ProcessedDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @processed_datum }
    end
  end

  # GET /processed_data/1/edit
  def edit
    @processed_datum = ProcessedDatum.find(params[:id])
  end

  # POST /processed_data
  # POST /processed_data.xml
  def create
    @processed_datum = ProcessedDatum.new(params[:processed_datum])

    respond_to do |format|
      if @processed_datum.save
        format.html { redirect_to(@processed_datum, :notice => 'Processed datum was successfully created.') }
        format.xml  { render :xml => @processed_datum, :status => :created, :location => @processed_datum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @processed_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /processed_data/1
  # PUT /processed_data/1.xml
  def update
    @processed_datum = ProcessedDatum.find(params[:id])

    respond_to do |format|
      if @processed_datum.update_attributes(params[:processed_datum])
        format.html { redirect_to(@processed_datum, :notice => 'Processed datum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @processed_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /processed_data/1
  # DELETE /processed_data/1.xml
  def destroy
    @processed_datum = ProcessedDatum.find(params[:id])
    @processed_datum.destroy

    respond_to do |format|
      format.html { redirect_to(processed_data_url) }
      format.xml  { head :ok }
    end
  end
end
