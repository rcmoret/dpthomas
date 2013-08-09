class ApplicationController < ActionController::Base
  protect_from_forgery
  expose(:page_title)

  def page_title
    controller = params[:controller]
    action = params[:action]
    return controller.capitalize if ['services', 'events'].include?(controller)
    return 'Donate' if action == 'donate'
    return 'Home Page' if controller == 'home' && action == 'index'
    if controller == 'members'
      return 'Foundation Information' if current_member
      return 'About the Foundation'
    end
  end

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
