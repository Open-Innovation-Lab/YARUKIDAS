class TrainersMessagesController < ApplicationController
  before_filter :admin, :except => ['show', 'read_more_trainer_message']
  before_filter :check_from_user

  def index
    @trainers_messages = TrainersMessage.all
  end
  
  def show
    if params[:name] && params[:date]
      @trainer = Trainer.find(:first, :conditions => ["alias = ?", params[:name]])

      @date = Time.parse(params[:date]).strftime("%Y-%m-%d")

      @trainers_message = TrainersMessage.find(:first, :conditions => ["trainer_id = ? and date = ?", @trainer.id, @date])
    elsif params[:id]
      @trainers_message = TrainersMessage.find(params[:id])
    else
      redirect_to :controller => 'home'
    end

    @user_comments = UserComment.find(
      :all,
      :conditions => ["trainers_message_id = ?", params[:id]]
    )
  end
  
  def new
    @trainers_message = TrainersMessage.new
  end
  
  def create
    @trainers_message = TrainersMessage.new(params[:trainers_message])
    if @trainers_message.save
      flash[:notice] = "Successfully created trainers message."
      redirect_to trainers_messages_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @trainers_message = TrainersMessage.find(params[:id])
  end
  
  def update
    @trainers_message = TrainersMessage.find(params[:id])
    if @trainers_message.update_attributes(params[:trainers_message])
      flash[:notice] = "Successfully updated trainers message."
      redirect_to @trainers_message
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @trainers_message = TrainersMessage.find(params[:id])
    @trainers_message.destroy
    flash[:notice] = "Successfully destroyed trainers message."
    redirect_to trainers_messages_url
  end
  
  def read_more_trainer_message
    @trainers_message = TrainersMessage.find(params[:id])

    render :update do |page|
      page.replace_html 'trainer_message', hbr(@trainers_message.contents)
    end
  end
end
