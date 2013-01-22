class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, namespace)
  end


  protected

    def namespace
      controller_name_segments = params[:controller].split('/')
      controller_name_segments.pop
      controller_namespace = controller_name_segments.join('/').camelize
    end
end
