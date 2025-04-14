class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user: Current.user))
  if @post.save
    redirect_to root_path, notice: "Post was successfully created"
  else
    render :new, status: :unprocessable_entity
  end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  @post = Post.find(params[:id])
  end

  def index
    @post = Current.user.posts.includes(:user)
  end

  private

  def post_params
  params.expect(post: [ :title, :body ])
  end
end
