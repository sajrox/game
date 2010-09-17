class MembersController < ApplicationController
  def profile
    logger.debug @member_auth

    render :action => 'index'
  end


  def logout
    session[:auth_member] = nil
    redirect_to :controller => 'index',
                :action     => 'index'
  end
end
