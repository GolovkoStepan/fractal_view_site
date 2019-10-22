class PostsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_post, only: [ :like, :unlike ]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all.page(params[:page])
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

  def like
    @post.like!(current_user)
    redirect_to @post
  end

  def unlike
    @post.unlike!(current_user)
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
