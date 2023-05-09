class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def profile_show
    @user = User.find(current_user.id)
  end
end
