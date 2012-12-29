class MembersController < ApplicationController

  expose (:members)

  # need to take out new once I get this up and running with some member
  # profiles
  before_filter except: [:index, :new] do
    if !member_signed_in?
      redirect_to :root
    end
  end

  def create
  end

  def new
  end

  def sign_in
  end
end
