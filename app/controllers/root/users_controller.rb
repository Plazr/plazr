class Root::UsersController < Root::ApplicationController
  
  def index
    @users = PlazrAuth::User.all
  end

  def show
    @user = PlazrAuth::User.find(params[:id])
    @roles = PlazrAuth::Role.all - @user.roles
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

  def addrole
    @user = PlazrAuth::User.find(params[:user_id])
    @role = PlazrAuth::Role.find(params[:role_id])
    @user.roles.push(@role) if (@user && @role)
    redirect_to(root_user_path(@user))
  end

  def rmrole
    @user = PlazrAuth::User.find(params[:user_id])
    @role = PlazrAuth::Role.find(params[:role_id])
    @user.roles.delete(@role) if (@user && @role)
    redirect_to(root_user_path(@user))
  end

end