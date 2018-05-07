class CategoriesController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show]

  def index
  end

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

    def category_params
      params.require(:category).permit(:title, :description, :image)
    end

end