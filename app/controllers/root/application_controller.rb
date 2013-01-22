class Root::ApplicationController < ApplicationController
  protect_from_forgery

  before_filter :check_root

  protected

    def check_root
      unless can? :admin, :plazr
        flash[:error] = 'You don\'t have permission to access this'
        redirect_to root_path
      end
    end
end
