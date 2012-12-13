class EmailListController < ApplicationController
  def index
    @email_list_members = EmailList.all
  end

  def new
  end

  def create
    @email_list = EmailList.new(params[:email_list])
    if @email_list.save
      flash[:notice] = "You successfully signed up for the email list."
      redirect_to '/'
    else
      flash[:error] = "Your sign up was unsuccessful; please check your information and try again."
      render :action => :new
    end
  end

end
