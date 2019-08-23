class UsersController < ApplicationController
  before_action :load_user, only: %i(show update)

  def show
    @user = User.find_by id: params[:id]
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    end
  end
  private

  def load_user
    return if @user = User.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit User::ATTR
  end
end
