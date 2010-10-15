# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :twitter_fix
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  helper_method :site_domain, :mypage

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  require "rexml/document"
  include REXML

protected

  def tweet(message)
    if current_user.twitter.post('/statuses/update.json', :status => message)
      redirect_to root_path
    else
      flash[:error] = 'ツイートに失敗しました。'
      redirect_to root_path
    end

    return
  end

  def twitter_fix
    if logged_in? and current_user.remember_token == nil
      @user = User.find(
        :first,
        :conditions => ["id = ?", current_user.id]
      )
      @user.remember_token = "b"
      @user.save

      redirect_to "http://yarukidas.me/logout"
      return true
    end
    
    return true
  end

  def shorten_url(url)
    Net::HTTP.version_1_2
    Net::HTTP.start('api.bit.ly', 80) do |http|
      @response = http.get('/v3/shorten?login=kilili&apiKey=R_3578ce973d312689525ed26e8f8bf572&longUrl=' + url + '&format=xml')
    end

    doc = Document.new @response.body
    doc.elements.each("response/data/url") do |element|
       @url = element.text
    end
    
    return @url
  end
  
  def user_page_url(user_login)
     return site_domain + "u/" + user_login
  end

  def admin
    if current_user.id != 1
      redirect_to root_path
    end
  end

  def site_domain
    return APP_CONFIG[:site_domain]
  end
end
