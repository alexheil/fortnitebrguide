class PostsController < ApplicationController

  before_action :authenticate_admin!, except: :show

  def show
  end

  def new
  end

  def create
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :description, :image, :content)
    end

end