class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def profile_show
    @user = User.find(current_user.id)
  end

  def profile_edit
    @user = User.find(current_user.id)
  end

  def profile_update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:name, :introduction))
      flash[:notice] = "ユーザーのプロフィールが更新されました"
      redirect_to :users_profile
    else
      render "profile_edit"
    end
  end
end
