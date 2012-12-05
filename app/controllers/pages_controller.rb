class PagesController < ApplicationController
  def index
    @email_list = Page.first
    @pages = Page.last(4)
  end

  def show

  end
end
