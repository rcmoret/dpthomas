class HomeController < ApplicationController
  def index
    @image_files = Dir["#{Rails.root}/app/assets/images/2013_walk_run/*.jpg"].collect do |f|
      f[/2013_walk_run.*$/]
    end
  end

  def show
  end
end
