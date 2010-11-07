class HomeController < ApplicationController
  def index
    @goals = Goal.find(
     :all,
     :conditions => ["user_id != ?", current_user.id],
     :order => 'opened_at DESC',
     :limit => 10
    )
  end

  def create_goal
    
    if params[:new_goal]
      new_goal_subject = params[:new_goal].to_s
    elsif params[:goal_id]
      new_goal_subject = Goal.find(:first, :conditions => ["id = ?", params[:goal_id].to_i]).subject
    end
    
    @goal = Goal.new
    @goal.user_id = current_user.id
    @goal.opened_at = Time.new
    @goal.subject = new_goal_subject
    @goal.save
      
    if @goal.subject.empty?
      flash[:notice] = '目標が空欄です。'
      redirect_to :controller => 'top', :action => 'home'
      return
    end

    flash[:notice] = "「" + new_goal_subject + "」という目標が追加されたよ"

    if RAILS_ENV == "production"
      @shorten_url = shorten_url(user_page_url current_user.login)

      @tweet = "「" + @goal.subject + "」をヤルコトに追加しました！ " + @shorten_url + " #yrkds"

      tweet @tweet
      return
    end

    redirect_to root_path
  end

  def cheer
    @cheer_message = CheerMessage.new
    @cheer_message.from_user_id = params[:from_user_id]
    @cheer_message.to_user_id = params[:to_user_id]
    @cheer_message.contents = params[:cheer]
    @cheer_message.save

    if RAILS_ENV == "production"
      flash[:notice] = @cheer_message.to_user.login + "さんに応援メッセージを送ったよ"

      @shorten_url = shorten_url(user_page_url @cheer_message.to_user.login)
      @tweet = "@" + @cheer_message.to_user.login + " 「" + @cheer_message.contents + "」 " + @shorten_url + " #yrkds"

      tweet @tweet
      return
    end

    redirect_to :controller => 'home'
  end
    
end
