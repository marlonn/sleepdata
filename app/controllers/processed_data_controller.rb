# endcoding: utf-8

class ProcessedDataController < ApplicationController
  include ActionView::Helpers::NumberHelper
  require "json"

  def index
    #@data = ProcessedDatum.all
    #@data = RawDatum.process_raw_data
    @mode   = params[:mode]
    @status = params[:status]
    @raw    = RawDatum.all

    if ProcessedDatum.count == 0
      RawDatum.process_raw_data
    elsif ProcessedDatum.count != 0
      if Time.parse(ProcessedDatum.first.begin) < (Time.parse(RawDatum.first.timestamp) - 1.day)
        RawDatum.process_raw_data
      end
    end
    @data = ProcessedDatum.all
  end

  def show
    @processed_datum = ProcessedDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @processed_datum }
    end
  end

  def new
    @processed_datum = ProcessedDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @processed_datum }
    end
  end

  def edit
    @processed_datum = ProcessedDatum.find(params[:id])
  end

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

  def destroy
    @processed_datum = ProcessedDatum.find(params[:id])
    @processed_datum.destroy

    respond_to do |format|
      format.html { redirect_to(processed_data_url) }
      format.xml  { head :ok }
    end
  end

end # of class
