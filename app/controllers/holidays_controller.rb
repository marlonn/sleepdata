class HolidaysController < ApplicationController

  def index
    @holidays = Holiday.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @holidays }
    end
  end

  def show
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @holiday }
    end
  end

  def new
    @holiday = Holiday.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @holiday }
    end
  end

  def edit
    @holiday = Holiday.find(params[:id])
  end

  def create
    @holiday = Holiday.new(params[:holiday])

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to(@holiday, :notice => 'Holiday was successfully created.') }
        format.xml  { render :xml => @holiday, :status => :created, :location => @holiday }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @holiday.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        format.html { redirect_to(@holiday, :notice => 'Holiday was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @holiday.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to(holidays_url) }
      format.xml  { head :ok }
    end
  end
  
end
