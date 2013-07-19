class RepliesController < ApplicationController

  def create
    reply = Reply.create(content: params[:reply][:content])
    reply.member_id = current_member.id
    reply.discussion_id = params[:discussion_id]

    if reply.save
      redirect_to discussion_path(params[:discussion_id]), notice: 'Your reply was successfully posted'
    else
      render :new, alert: 'There was an error'
    end
  end
end
