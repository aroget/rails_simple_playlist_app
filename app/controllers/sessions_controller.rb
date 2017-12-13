class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user

      profile = Profile.find_by(user_id:user.id)

      if profile.nil?
        create_profile(user.id)
      end

      redirect_to root_url
    else
      flash.now[:danger] = 'Credentials do not match any record'

      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

  def create_profile(user_id)
    Profile.create(user_id:user_id)
  end
end
