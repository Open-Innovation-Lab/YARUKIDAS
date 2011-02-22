class TopController < ApplicationController

  def index
    unless logged_in?
      @goals = Goal.todo(:limit => 5)
      @finished_goals = Goal.finished(:limit => 5)
    else
      redirect_to :controller => 'home'
    end
  end

  def home
    if params[:id]
      redirect_to :controller => 'home', :id => params[:id]
      return
    else
      redirect_to :controller => 'home'
      return
    end
  end
end
