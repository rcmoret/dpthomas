class ApplicationController < ActionController::Base
  def after_sign_in_path_for(member)
    '/email'
  end

end
