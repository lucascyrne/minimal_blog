# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user
  rescue_from ActiveRecord::RecordNotFound, with: :user_not_found

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_not_found
    session.delete(:user_id)
    redirect_to login_path, alert: "Sua sessão expirou. Por favor, faça login novamente."
  end
end
