class HomeController < ApplicationController
  def index
  end

  def show
  end

  private

  def page_title
    params[:action] == 'donate' ? 'Donate' : 'Home Page'
  end
end
