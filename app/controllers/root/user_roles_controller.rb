class Root::UserRolesController < Root::ApplicationController

  def add
    bindings.pry
    @user = PlazrAuth::User.find(params[:user_id])
    @role = PlazrAuth::Role.find(params[:role_id])
    @user.roles.push(@roles) if (@user && @role)
  end

  def rem
    @user = PlazrAuth::User.find(params[:user_id])
    @role = PlazrAuth::Role.find(params[:role_id])
    @user.roles.delete(@role) if (@user && @role)
  end

end