class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def edit
    check_user
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def update
    @profile = Profile.find(params[:id])
    edited_profile = profile_params

    if edited_profile[:avatar]
      avatar = Cloudinary::Uploader.upload(edited_profile[:avatar])['secure_url']
      edited_profile[:avatar] = avatar
    end

    if @profile.update(edited_profile)
      redirect_to profile_path(@profile)
    else
      @profile.errors.full_messages do |msg|
        flash[:danger] = msg
      end
      render 'edit'
    end
  end

  private
  def check_user
    redirect_to root_path if params[:id].to_i != current_user.id.to_i
  end

  def profile_params
    params.require(:profile).permit(:bio, :avatar)
  end
end
