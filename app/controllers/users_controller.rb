class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Handle successful save
      flash[:success] = "Welcome to Friend-O!"
      redirect_to root
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                  :password_confirmation)
    end

end
