class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @pagy, @posts = pagy(@user.feed.in_order,limit: 9)

    respond_to do |format|
      format.html
      format.turbo_stream
    end

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
