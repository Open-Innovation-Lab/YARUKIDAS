class HomeController < ApplicationController
  def index
    unless logged_in?
      redirect_to root_path
      return
    end
    @goals = Goal.todo(:limit => 10)
    @finished_goals = Goal.finished(:limit => 10)
    @mygoals = current_user.goals.todo
    @myfinished_goals = current_user.goals.finished(:limit => 10)
    @cheer_messages = CheerMessage.messages(:to_user_id => current_user.id)

    @new_goal = Goal.new
  end
end
