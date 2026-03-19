class DashboardController < ApplicationController
  def index
    @posts = Post.not_mine(current_user)

  end
end
