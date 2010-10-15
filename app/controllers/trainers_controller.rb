class TrainersController < ApplicationController
  before_filter :admin

  def index
    @trainers = Trainer.all
  end
  
  def show
    @trainer = Trainer.find(params[:id])
  end
  
  def new
    @trainer = Trainer.new
  end
  
  def create
    @trainer = Trainer.new(params[:trainer])
    if @trainer.save
      flash[:notice] = "Successfully created trainer."
      redirect_to @trainer
    else
      render :action => 'new'
    end
  end
  
  def edit
    @trainer = Trainer.find(params[:id])
  end
  
  def update
    @trainer = Trainer.find(params[:id])
    
    if @trainer.update_attributes(params[:trainer])
      flash[:notice] = "Successfully updated trainer."
      redirect_to @trainer
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    flash[:notice] = "Successfully destroyed trainer."
    redirect_to trainers_url
  end
end
