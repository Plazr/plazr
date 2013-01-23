class Ability
  include CanCan::Ability
  def initialize(user, namespace = nil)

    @user = user || PlazrAuth::User.new

    @user.roles.each { |role| send role.name.downcase }
    #case namespace
    #  when 'Admin'
    #    can :admin, :all if user.is_admin?
    #  else
    #    can :read, PZS::Product
    #end
  end

  # unregistered users
  # (all users have these permissions)
  def unregistered
  end


  def user
    unregistered
    can :create, :store
  end


  def staff
  end


  def admin
  end

  # in plazr_store, a root can do the same as an admin
  def root
    can :admin, :plazr
  end

  def method_missing(method, *args, &block)
    return
  end

end
