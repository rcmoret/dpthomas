class EmailListController < ApplicationController
  def join
  end

  def new
  end

  def create
    @email_list = EmailList.new(params[:email_list])
    if @email_list.save
      flash[:notice] = "You successfully signed up for the email list."
      redirect_to '/'
    else
      flash[:error] = "Your sign up was unsucessful; please check your information and try again."
      render :action => :new
    end
  end

end
