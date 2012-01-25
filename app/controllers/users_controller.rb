class UsersController < ApplicationController
  before_filter :check_from_user

  def show
    unless logged_in? or params[:id]
      redirect_to :controller => 'top'
      return
    end

    if params[:id]
      @user = User.find_by_login(params[:id])
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

    if @user == nil
      redirect_to root_path
      return
    elsif @user.id == current_user.id
      @mypage = true
    else
      @mypage = false
    end

    @goals = Goal.todo(:limit => 10)
    @finished_goals = Goal.finished(:limit => 10)
    @cheer_messages = CheerMessage.messages(:to_user_id => @user.id)

    @new_cheer_message = CheerMessage.new
    @new_cheer_log = CheerLog.new
    @new_goal = Goal.new
  end
end
