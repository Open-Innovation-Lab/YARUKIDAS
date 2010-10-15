class TopController < ApplicationController
  def index
    if logged_in?
      redirect_to :controller => 'home'
      return
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
