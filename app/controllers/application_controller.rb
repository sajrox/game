class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_authorization

  protected
  def check_authorization
    if session[:auth_member].nil?
      session[:auth_pre_controller] = params[:controller]
      session[:auth_pre_action] = params[:action]

      redirect_to :controller => 'auth', 
                  :action     => 'login'
    else
      @auth_member = Member.find(session[:auth_member][:id])
      redirect_to :controller => 'auth',
                  :action     => 'logout' if @auth_member.nil?
    end
  end
end
