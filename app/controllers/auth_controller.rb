class AuthController < ApplicationController

  skip_before_filter :check_authorization, :only => ['signout']

  # Nadpisujemy metode. Nowa zawartość metody sprawdza czy użytkownik jest
  # zalogowany. Jeśli tak przenosimy go do jego profilu
  # Do kontrolera 'auth' mają dostęp tylko osoby niezalogowane
  def check_authorization
    unless session[:member_auth].nil?
      redirect_to profile_url
    end
  end

  # Wyświetla formularz do logowania oraz obsługuje zdarzenie logowania
  def signin
    unless request.post?
      @member = Member.new
    else
      @member = Member.new(params[:member])

      member_find = Member.find_by_login(params[:member][:login])
      @errors = {}

      unless member_find.nil?
        if member_find.hpassword == Member.hashed_password(params[:member][:password], member_find.salt)
          session[:member_auth] = member_find.id
          redirect_to :url => session[:request_url]
        else
          @errors[:incorrect_password] = __'Hasło nie jest poprawne'
        end
      else
        @errors[:incorrect_login] = __'Nazwa użytkownika nie jest poprawna'
      end
    end
  end

  # Wyświetla formularz do rejestracji użytkownika oraz obsługuje zdarzenie rejestracji
  def signup
    unless request.post?
      @member = Member.new
    else
      @member = Member.new params[:member]

      if @member.save
        redirect_to signin_url
      end
    end
  end

  # Wylogowanie użytkownika
  def signout
    authorization_destroy
    redirect_to signin_url
  end
end
