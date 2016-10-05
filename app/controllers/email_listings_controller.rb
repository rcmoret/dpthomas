class EmailListingsController < ApplicationController
  expose(:email_listing)
  expose(:email_listings)

  before_filter :authenticate!, only: :index

  def create
    if email_listing.save
      redirect_to root_path, notice: 'thanks for signing up for the mailing list'
    else
      render :new, alert: 'there was an error; please submit again'
    end
  end

  private

  def email_listing_params
    params.require(:email_listing).permit(*%i(first_name last_name email))
  end
end
