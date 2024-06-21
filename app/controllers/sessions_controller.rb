# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    @on_login_page = true  # Define que o usuário está na página de login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to posts_path, notice: "Login successful!"
    else
      @on_login_page = true  # Garantir que a variável seja definida novamente em caso de falha na autenticação
      flash.now[:alert] = "Email ou senha inválidos."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path, notice: "Logged out successfully."
  end
end
