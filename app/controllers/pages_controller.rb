class PagesController < ApplicationController
  def index
    @post = Post.all.includes(:user, likes: :user)
  end
end
