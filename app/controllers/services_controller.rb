class ServicesController < ApplicationController
  expose(:services) { Service.all }
  expose(:service)

  before_filter :authenticate!, except: :index

  def create
    if service.save
      redirect_to members_dashboard_path, notice: "#{service.name} added as a service"
    else
      render :new, alert: 'There was an error creating the service'
    end
  end

  def update
    if service.save
      redirect_to members_dashboard_path, notice: "#{service.name} service was edited"
    else
      render :edit, alert: 'There was an error editing the service'
    end
  end

  def destroy
    service.destroy
    redirect_to members_dashboard_path, notice: "Service was removed"
  end

  private

  def service_params
    params.require(:service).permit(*%i(name details))
  end
end
