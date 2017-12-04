class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
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
end
