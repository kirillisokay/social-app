class LikesController < ApplicationController
  before_action :authenticated?

def create
  @likable = find_likable  # e.g., Post.find(params[:post_id])
puts "Current.user: #{Current.user.inspect}"  # Check what it is
  @like = @likable.likes.build(user: Current.user)
  if @like.save
    redirect_back(fallback_location: posts_path, notice: "Liked!")
  else
    redirect_back(fallback_location: posts_path, alert: "Couldn’t like this.")
  end
end

  private

  def find_likable
    Post.find(params[:post_id]) if params[:post_id]
  end
end
