class ApplicationController < ActionController::Base
  # Ustawienia klasy
  protect_from_forgery
  before_filter :check_authorization

  # Zmienne instancyjne klasy
  @member_auth = nil

  ### METHODS ##################################################################

  # Sprawdzanie czy użytkownik jest zalogowany. W przypadku braku wpisu w bazie
  # o zalogowanej osobie, zostaje ona wylogowana (czyszczenie sesji)
  def check_authorization
    if session[:member_auth].nil?
      session[:request_url] = request.env['REQUEST_URI']

      redirect_to signin_url
    else
      @member_auth = Member.find (session[:member_auth])
      if @member_auth.nil?
        authorization_destroy
        redirect_to signout_url
      end
    end
  end

  # Tworzenie linku do strony logowania
  def signin_url
    {:controller => 'auth', :action => 'signin'}
  end

  # Tworzenie linku do strony wylogowania
  def signout_url
    {:controller => 'auth', :action => 'signout'}
  end

  # Tworzenie linku do strony wylogowania
  def profile_url
    {:controller => 'members', :action => 'profile'}
  end

  ## Niszczenie sesji z danymi użytkownika
  def authorization_destroy
    session[:member_auth] = nil
    session[:request_url] = nil
  end
end
