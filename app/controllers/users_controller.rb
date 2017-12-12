class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      create_profile(@user.id)

      UserMailer.welcome_message(@user).deliver

      flash[:success] = 'Account created successfully'
      redirect_to root_path
    else
      @user.errors.full_messages.each do |msg|
        flash[:danger] = msg
      end
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :user_name, :password, :password_confirmation)
  end

  def create_profile(user_id)
    Profile.create(user_id:user_id)
  end
end
