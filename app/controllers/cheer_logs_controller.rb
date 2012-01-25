class CheerLogsController < ApplicationController
  before_filter :check_from_user

  def index
    @cheer_logs = CheerLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cheer_logs }
    end
  end

  def show
    @cheer_log = CheerLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cheer_log }
    end
  end

  def new
    @cheer_log = CheerLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cheer_log }
    end
  end

  def edit
    @cheer_log = CheerLog.find(params[:id])
  end

  def create
    @cheer_log = CheerLog.new(params[:cheer_log])

    if @cheer_log.save
      if RAILS_ENV == "production"
        goal = Goal.find(@cheer_log.goal_id)
        @shorten_url = shorten_url(user_page_url goal.user.login)
        @tweet = "がんばって！ RT @" + goal.user.login + ":「" + goal.subject + "」 " + @shorten_url + " #yrkds"

        tweet @tweet
        redirect_to root_path, :notice => @cheer_log.to_user.login + 'さんを応援しました！'
        return
      end
    else
      redirect_to :back
    end
  end

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

  def destroy
    @cheer_log = CheerLog.find(params[:id])

    redirect_to root_url
    return 

    @cheer_log.destroy

    respond_to do |format|
      format.html { redirect_to(cheer_logs_url) }
      format.xml  { head :ok }
    end
  end
end
