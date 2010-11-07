class HomeController < ApplicationController
  def index
    @goals = Goal.find(
     :all,
     :order => 'opened_at DESC',
     :limit => 3
    )
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
end
