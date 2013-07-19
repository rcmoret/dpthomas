class DiscussionsController < ApplicationController
  expose(:discussions)
  expose(:discussion)

  before_filter :authenticate!

  def create
    discussion.member_id = current_member.id
    if discussion.save
      redirect_to members_dashboard_path, notice: 'Your discussion was created'
    else
      render :new, alert: 'There was an error creating your discussion'
    end
  end
end
