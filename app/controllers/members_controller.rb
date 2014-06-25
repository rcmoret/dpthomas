class MembersController < ApplicationController
  expose(:members_with_profiles){ Member.completed_profiles.by_rank }
  expose(:members){ Member.by_rank }
  expose(:member)
  expose(:past_events){ Event.non_archived_events }
  expose(:future_events){ Event.in_the_future }
  expose(:discussions){ Discussion.recent_first.limit(5) }

  before_filter :authenticate!, except: [:index, :show]

  def edit
    # redirect_to edit_member_path(current_member) if params[:id].to_i != current_member.id
  end

  def update
    if member.save
      redirect_to members_path, notice: 'You successfully updated your profile'
    else
      render :edit, alert: 'There was an error updating your profile'
    end
  end
end
