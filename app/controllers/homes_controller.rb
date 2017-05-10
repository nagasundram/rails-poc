class HomesController < ApplicationController
  def index
    if current_user.present?
      @user = current_user
      @paintings = current_user.paintings
    end
  end
end
