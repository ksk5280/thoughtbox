class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Your account has been successfully created #{@user.email}!"
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash[:danger] = @user.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
