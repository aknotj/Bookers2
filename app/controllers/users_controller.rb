class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(@user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
    if @user.update(user_params)
      flash[:notice] = "Your profile was successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private

def user_params
  params.require(:user).permit(:name, :body, :profile_image)
end

end
