class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @on_login_page = true
    @user = User.new(user_params)
    @user.role = 'member'
    if @user.save
      session[:user_id] = @user.id  # Inicia a sessão para o usuário recém-criado
      redirect_to root_path, notice: 'User was successfully created and logged in.'
    else
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
