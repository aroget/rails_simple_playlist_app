class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def edit
    check_user
  end

  private
  def check_user
    redirect_to root_path if params[:id].to_i != current_user.id.to_i
  end
end
