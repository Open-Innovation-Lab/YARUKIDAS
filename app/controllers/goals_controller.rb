class GoalsController < ApplicationController
  before_filter :admin

  def index
    @goals = Goal.all
  end
  
  def show
    @goal = Goal.find(params[:id])
  end
  
  def new
    @goal = Goal.new
  end
  
  def create
    @goal = Goal.new(params[:goal])
    if @goal.save
      flash[:notice] = "Successfully created goal."
      redirect_to @goal
    else
      render :action => 'new'
    end
  end
  
  def edit
    @goal = Goal.find(params[:id])
  end
  
  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(params[:goal])
      flash[:notice] = "Successfully updated goal."
      redirect_to @goal
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:notice] = "Successfully destroyed goal."
    redirect_to goals_url
  end
end
