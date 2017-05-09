class HomesController < ApplicationController
  def index
    @user = current_user
    @images = current_user.images
  end
end
