class CheerLogsController < ApplicationController
  before_filter :admin

  # GET /cheer_logs
  # GET /cheer_logs.xml
  def index
    @cheer_logs = CheerLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cheer_logs }
    end
  end

  # GET /cheer_logs/1
  # GET /cheer_logs/1.xml
  def show
    @cheer_log = CheerLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cheer_log }
    end
  end

  # GET /cheer_logs/new
  # GET /cheer_logs/new.xml
  def new
    @cheer_log = CheerLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cheer_log }
    end
  end

  # GET /cheer_logs/1/edit
  def edit
    @cheer_log = CheerLog.find(params[:id])
  end

  # POST /cheer_logs
  # POST /cheer_logs.xml
  def create
    @cheer_log = CheerLog.new(params[:cheer_log])

    respond_to do |format|
      if @cheer_log.save
        format.html { redirect_to(@cheer_log, :notice => 'CheerLog was successfully created.') }
        format.xml  { render :xml => @cheer_log, :status => :created, :location => @cheer_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cheer_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cheer_logs/1
  # PUT /cheer_logs/1.xml
  def update
    @cheer_log = CheerLog.find(params[:id])

    respond_to do |format|
      if @cheer_log.update_attributes(params[:cheer_log])
        format.html { redirect_to(@cheer_log, :notice => 'CheerLog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cheer_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cheer_logs/1
  # DELETE /cheer_logs/1.xml
  def destroy
    @cheer_log = CheerLog.find(params[:id])
    @cheer_log.destroy

    respond_to do |format|
      format.html { redirect_to(cheer_logs_url) }
      format.xml  { head :ok }
    end
  end
end
