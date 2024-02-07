class HomeController < ApplicationController
  def index
    @photo_files = Dir.glob('app/assets/images/gallery/*')
  end
end
