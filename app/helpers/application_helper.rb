module ApplicationHelper
  def is_authorization?
      unless session[:auth_member].nil? or session[:auth_member][:id].nil?
        member = Member.find(session[:auth_member][:id])
        unless member.nil?
          return true
        end
      end

      return false
  end
end
