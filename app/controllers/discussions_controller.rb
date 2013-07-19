class DiscussionsController < ApplicationController
  expose(:discussions){ Discussion.recent_first.page(params[:page]).per(10) }
  expose(:discussion)
  expose(:reply){ Reply.new }
  expose(:replies){ discussion.replies }

  before_filter :authenticate!

  def update
    discussion.member_id = current_member.id
    if discussion.save
      redirect_to members_dashboard_path, notice: 'Your discussion was updated'
    else
      render :edit, alert: 'There was an error creating your discussion'
    end
  end

  def create
    discussion.member_id = current_member.id
    if discussion.save
      redirect_to members_dashboard_path, notice: 'Your discussion was created'
    else
      render :new, alert: 'There was an error creating your discussion'
    end
  end
end
