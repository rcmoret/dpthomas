class RepliesController < ApplicationController

  def create
    if reply.save
      redirect_to discussion_path(params[:discussion_id]), notice: 'Your reply was successfully posted'
    else
      render :new, alert: 'There was an error'
    end
  end

  private

  def reply
    @reply ||= Reply.build(content: params[:reply][:content],
                           member_id: current_member.id,
                           discussion_id: params[:discussion_id])
  end

  def reply_params
    params.require(:reply).permit(*%i(content discussion_id member_id))
  end
end
