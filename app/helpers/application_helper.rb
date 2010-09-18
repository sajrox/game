module ApplicationHelper
  def is_authorization?
      unless session[:member_auth].nil?
        member = Member.find(session[:member_auth])
        unless member.nil?
          return true
        end
      end

      return false
  end
end
