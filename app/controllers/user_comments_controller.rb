class UserCommentsController < ApplicationController
  before_filter :admin, :except => 'show'
  before_filter :check_from_user

  def index
    @user_comments = UserComment.all
  end
  
  def show
    @user_comment = UserComment.find(params[:id])
  end
  
  def new
    @user_comment = UserComment.new
  end
  
  def create
    @user_comment = UserComment.new(params[:user_comment])
    if @user_comment.save
      flash[:notice] = "Successfully created user comment."
      redirect_to @user_comment
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user_comment = UserComment.find(params[:id])
  end
  
  def update
    @user_comment = UserComment.find(params[:id])
    if @user_comment.update_attributes(params[:user_comment])
      flash[:notice] = "Successfully updated user comment."
      redirect_to @user_comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user_comment = UserComment.find(params[:id])
    @user_comment.destroy
    flash[:notice] = "Successfully destroyed user comment."
    redirect_to user_comments_url
  end
end
