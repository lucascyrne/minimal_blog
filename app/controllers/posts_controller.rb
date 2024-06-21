#app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :create, :new, :destroy]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    Rails.logger.info session[:user_id]

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post foi deletado com sucesso.'
  end
  
  def like
    @post = Post.find(params[:id])
    # Implementar a lógica para adicionar um like ao post
    # Por exemplo, aumentar um contador ou criar um novo modelo Like
  end

  private

  def check_permissions
    action = "#{params[:action]}_post"
    redirect_to root_path, alert: "You don't have permission to do that." unless Permission.allowed?(current_user, action)
  end

  def require_login
    Rails.logger.info "Session User ID: #{session[:user_id]}"
    Rails.logger.info "Current User: #{current_user.inspect}"
    redirect_to login_path, notice: "Você deve estar logado para acessar essa página." unless current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
