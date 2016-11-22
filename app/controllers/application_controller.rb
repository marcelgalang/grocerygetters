class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :authenticate_user!, except: [:create, :new]
   before_action :admin_only, only: :destroy


   private

   def admin_only
    unless current_user.admin? || @user == current_user
      redirect_to users_path, :alert => "Access denied."
    end
  end

end
