class HomeController < ApplicationController
  def index
    unless logged_in? or params[:id]
      redirect_to :controller => 'top'
      return
    end

    if params[:id]
      @user = User.find(params[:id])
    elsif params[:name]
      @user = User.find(:first, :conditions => ["login = ?", params[:name]])
      unless @user
        redirect_to :controller => 'top'
        return
      end
    elsif logged_in?
      @user = current_user
    else
      redirect_to root_path
      return
    end

    if @user.id.to_i == current_user.id
      @mypage = true
    else
      @mypage = false
    end

    @goals = Goal.find(
     :all,
     :conditions => ["user_id = ? and closed_at IS NULL", @user.id],
     :order => 'opened_at DESC'
    )
    
    @finished_goals = Goal.find(
      :all,
      :conditions => ["user_id = ? and closed_at IS NOT NULL", @user.id],
      :order => 'closed_at DESC',
      :limit => 5
    )

    @cheer_messages = CheerMessage.find(
      :all,
      :conditions => ["to_user_id = ?", @user.id]
    )

    @trainers_message = TrainersMessage.find(
      :first,
      :conditions => ["trainer_id = ? and date = ?", 1, Time.now.strftime("%Y-%m-%d")]
    )

  end

  def finished
    if params[:mypage] == '1'
      @goal = Goal.find(params[:id])
      @goal.closed_at = Time.now
      @goal.save

      if RAILS_ENV == "production"
        flash[:notice] = "「" + @goal.subject + "」という目標を達成したよ"

        @shorten_url = shorten_url(user_page_url current_user.login)
        @tweet = "「" + @goal.subject + "」を達成しました！ " + @shorten_url + " #yrkds"

        tweet @tweet
        return
      end
    else
      @cheer_log = CheerLog.new
      @cheer_log.from_user_id = current_user.id
      @cheer_log.to_user_id = params[:to_user_id]
      @cheer_log.goal_id = params[:id]
      @cheer_log.save

      @goal = Goal.find(params[:id])

      if RAILS_ENV == "production"
        flash[:notice] = @goal.user.login + "さんを応援しました！"

        @shorten_url = shorten_url(user_page_url @goal.user.login)
        @tweet = "がんばって！ RT @" + @goal.user.login + ":「" + @goal.subject + "」 " + @shorten_url + " #yrkds"

        tweet @tweet
        return
      end
    end

    redirect_to root_path
  end

    def comment
      @comment = UserComment.new
      @comment.user_id = params[:user_id]
      @comment.trainers_message_id = params[:trainers_message_id]
      @comment.contents = params[:comment]
      @comment.save

      if RAILS_ENV == "production"
        flash[:notice] = "トレーナーへの感想を送ったよ"

        @shorten_url = shorten_url site_domain + "trainers_messages/" + @comment.id.to_s
        @tweet = "「" + @comment.contents + "」 " + @shorten_url + " #yrkds"

        tweet @tweet
        return
      end

      redirect_to :controller => 'trainers_messages', :action => 'show', :id => params[:trainers_message_id]
    end

    def create_goal
      @goal = Goal.new
      @goal.user_id = current_user.id
      @goal.opened_at = Time.new
      @goal.subject = params[:new_goal].to_s
      @goal.save
      
      if @goal.subject.empty?
        flash[:notice] = '目標が空欄です。'
        redirect_to :controller => 'top', :action => 'home'
        return
      end

      if RAILS_ENV == "production"
        flash[:notice] = "「" + params[:new_goal].to_s + "」という目標が追加されたよ"

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
    
    def read_more_trainer_message
      @trainers_message = TrainersMessage.find(params[:id])

      render :update do |page|
        page.replace_html 'trainer_message', hbr(@trainers_message.contents)
      end
    end
end
