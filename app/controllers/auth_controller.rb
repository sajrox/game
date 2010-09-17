class AuthController < ActionController::Base
  before_filter :check_authorization
  
  def check_authorization
    unless session[:auth_member].nil?
      redirect_to :controller => 'members',
                  :action     => 'profile'
    end
  end

  
  def login
    unless request.post?
      @member = Member.new
    else
      @member = Member.new(params[:member])
      member_find = Member.find_by_login(params[:member][:login])
      errors = {}

      unless member_find.nil?
        if member_find.hpassword == Member.hashed_password(params[:member][:password], member_find.salt)
          session[:auth_member] = {:id => member_find.id}
          redirect_to :controller => session[:auth_pre_controller], 
                      :action     => session[:auth_pre_action]
        end
      end

      errors[:login_error] = 'Logowanie nie powiodło się'
    end
  end


  def register
    unless request.post?
      @member = Member.new
    else
      @member = Member.new params[:member]

      if @member.save
        redirect_to :controller => 'members',
                    :action     => 'profile'
      end
    end
  end


  def forgot_password
  end
end
