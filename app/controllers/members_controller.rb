class MembersController < ApplicationController
  expose(:members_with_profiles){ Member.completed_profiles }
  expose(:members)
  expose(:member)
  expose(:future_events){ Event.in_the_future }

  before_filter :authenticate!, except: [:index, :show]

  def update
    if member.save
      redirect_to members_path, notice: 'You successfully updated your profile'
    else
      render :edit, alert: 'There was an error updating your profile'
    end
  end
end
