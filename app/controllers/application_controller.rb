class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(member)
    if current_member.incomplete_profile?
      edit_member_path(current_member)
    else
      members_dashboard_path
    end
  end

  private
  def authenticate!
    unless current_member
      redirect_to new_member_session_path, alert: 'Must be signed in'
      false
    end
  end
end
