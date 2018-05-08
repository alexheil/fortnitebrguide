class PostsController < ApplicationController

  before_action :authenticate_admin!, except: :show

  def index
    @posts = Post.all
    @categories = Category.all
    @recent_posts = Post.reorder("created_at desc").limit(5)
  end

  def show
    @post = Post.friendly.find(params[:id])
    @category = Category.friendly.find(params[:category_id])
    @categories = Category.all
    @recent_posts = Post.reorder("created_at desc").limit(5)
  end

  def create
    @category = Category.friendly.find(params[:category_id])
    @post = @category.posts.build(post_params)
    if @post.save
      flash[:notice] = "You just created " + @post.title + "!"
      redirect_to category_post_path(@category, @post)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def new
    @post =  Post.new
    @category = Category.friendly.find(params[:category_id])
  end

  def update
    @category = Category.friendly.find(params[:category_id])
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Good job!"
      redirect_to category_post_path(@category, @post)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
    @category = Category.friendly.find(params[:category_id])
  end

  def destroy
    @post = Post.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def post_params
      params.require(:post).permit(:title, :description, :image, :content)
    end

end