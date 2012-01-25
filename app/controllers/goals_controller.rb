class GoalsController < ApplicationController
  before_filter :login
  before_filter :check_from_user

  def create
    @goal = Goal.new(params[:goal])
    if @goal.save
      flash[:notice] = "「" + @goal.subject + "」をヤルコトに追加したよ！"
      if RAILS_ENV == "production"
        @shorten_url = shorten_url(user_page_url current_user.login)
        @tweet = "「" + @goal.subject + "」をヤルコトに追加しました！ " + @shorten_url + " #yrkds"
        tweet @tweet
      end
      redirect_to root_path
      return
    else
      flash[:notice] = 'ヤルコトの追加に失敗しました'
      redirect_to root_path
      return
    end
  end
  
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:notice] = @goal.subject + "を削除しました"
    redirect_to :back
  end

  def finish
    @goal = Goal.find(params[:id])

    if @goal.finish
      if RAILS_ENV == "production"
        @shorten_url = shorten_url(user_page_url current_user.login)
        @tweet = "「" + @goal.subject + "」を達成しました！ " + @shorten_url + " #yrkds"

        tweet @tweet
      end
      redirect_to :back, :notice => "「" + @goal.subject + "」という目標を達成したよ"
      return
    else
      redirect_to :back, :notice => "達成に失敗しました。"
      return
    end
  end

  def archive
    @user = User.find_by_login(params[:id]) || current_user
    @goals = Goal.todo(:limit => 10)
    @finished_goals = Goal.finished(:limit => 10)
    @new_goal = Goal.new
  end

  def alltodo
    @new_goal = Goal.new
    @new_cheer_log = CheerLog.new
    @goals = Goal.todo.paginate(:page => params[:page], :per_page => 10)
    @all_goals = Goal.todo
    @mygoals = current_user.goals.todo(:limit => 10)
    @myfinished_goals = current_user.goals.finished(:limit => 10)
    @cheer_messages = CheerMessage.messages(:to_user_id => current_user.id)
  end

  def allcomplete
    @new_goal = Goal.new
    @finished_goals = Goal.finished.paginate(:page => params[:page], :per_page => 10)
    @mygoals = current_user.goals.finished(:limit => 10)
    @myfinished_goals = current_user.goals.finished(:limit => 10)
    @cheer_messages = CheerMessage.messages(:to_user_id => current_user.id)
  end
end
