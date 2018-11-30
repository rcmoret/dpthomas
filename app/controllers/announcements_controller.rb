class AnnouncementsController < ApplicationController
  expose(:announcement)
  expose(:announcements) { Announcement.by_priority }

  before_filter :authenticate!

  def index
    if announcements.none?
      redirect_to new_announcement_path, notice: 'There are currently no site announcements. Would you like to create one?'
    end
  end

  def create
    if announcement.save
      redirect_to announcements_path, notice: 'You have successfully created an announcement'
    else
      render :new, alert: 'There was an error saving your announcment'
    end
  end

  def update
    if announcement.update(announcement_params)
      redirect_to announcements_path, notice: 'You have successfully updated an announcement'
    else
      render :edit, alert: 'There was an error saving your update to an announcment'
    end
  end

  def destroy
    if announcement.destroy
      redirect_to announcements_path, notice: 'You have deleted a site announcement'
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:announcement, :priority)
  end

end
