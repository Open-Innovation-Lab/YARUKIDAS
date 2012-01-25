class CheerMessagesController < ApplicationController
  before_filter :check_from_user

  def index
    @cheer_messages = CheerMessage.all
  end
  
  def show
    @cheer_message = CheerMessage.find(params[:id])
  end
  
  def new
    @cheer_message = CheerMessage.new
  end
  
  def create
    @cheer_message = CheerMessage.new(params[:cheer_message])
    if @cheer_message.save
      redirect_to :back, :notice => '応援メッセージを送りました。'
    else
      render :action => 'new'
      redirect_to :back
    end
  end
  
  def edit
    @cheer_message = CheerMessage.find(params[:id])
  end
  
  def update
    @cheer_message = CheerMessage.find(params[:id])
    if @cheer_message.update_attributes(params[:cheer_message])
      flash[:notice] = "Successfully updated cheer message."
      redirect_to @cheer_message
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @cheer_message = CheerMessage.find(params[:id])
    @cheer_message.destroy
    flash[:notice] = "Successfully destroyed cheer message."
    redirect_to cheer_messages_url
  end
end
