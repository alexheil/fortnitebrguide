class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
    @recent_posts = Post.reorder("created_at desc").limit(5)
    @email = Email.new
  end

end