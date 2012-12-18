class Root::UsersController < Root::ApplicationController
  
  def index
    @users = PlazrAuth::User.all
  end

  def show
    @user = PlazrAuth::User.find(params[:id])
  end

  def edit
    @user = PlazrAuth::User.find(params[:id])
  end

  def update
    @user = PlazrAuth::User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to(root_user_path(@user))
  end

  def destroy
    @user = PlazrAuth::User.find(params[:id])
    @user.destroy
    redirect_to root_users_path
  end

end