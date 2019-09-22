class PostsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params.merge(user: current_user))
    @post.main_picture.attach(params[:post][:main_picture])

    if @post.save
      redirect_to @post, notice: "Пост успешно создан."
    else
      flash[:alert] = "При создании поста возникли ошибки"
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
