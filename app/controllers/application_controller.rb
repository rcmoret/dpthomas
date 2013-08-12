class ApplicationController < ActionController::Base
  protect_from_forgery
  expose(:page_title)
  expose(:announcements)

  def page_title
    controller = params[:controller]
    action = params[:action]
    case
    when ['announcements', 'services', 'events'].include?(controller)
      controller.capitalize
    when action == 'donate'
      'Donate'
    when controller == 'home' && action == 'index'
      'Home Page'
    when controller == 'members' && current_member
      'Foundation Information'
    when controller == 'members' && !current_member
      'About the Foundation'
    else
      ''
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
