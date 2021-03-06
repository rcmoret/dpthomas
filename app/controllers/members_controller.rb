class MembersController < ApplicationController
  expose(:members_with_profiles) { Member.completed_profiles.by_rank }
  expose(:members) { Member.by_rank }
  expose(:member)
  expose(:past_events) { Event.non_archived_events }
  expose(:future_events) { Event.in_the_future }
  expose(:discussions) { Discussion.recent_first.limit(5) }

  before_filter :authenticate!, except: [:index, :show]

  def edit
  end

  def update
    if member.update(member_params)
      redirect_to members_path, notice: 'You successfully updated your profile'
    else
      render :edit, alert: 'There was an error updating your profile'
    end
  end

  private

  def page_title
    current_member ? 'Foundation Information' : 'About the Foundation'
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :position, :biography, :phone)
  end
end
