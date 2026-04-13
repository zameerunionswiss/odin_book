class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.not_mine(current_user).in_order

  end
  def switch
    if @page == post do
      render partial: "post", data: { turbo_frame: "post_ad"}
    end
    else
      render edit_post_path, data: {turbo_frame: "post_ad"}
    end
  end
end
