class FollowsController < ApplicationController

  def index
  @user = User.find(params[:user_id])
    @followers = @user.following
  end

  def show
    @followed_user = User.find(params[:id])
  end
  def create
    @user = User.find(params[:followed_id])
    Follow.create(follower_id: current_user.id, followed_id: @user.id)
    redirect_back fallback_location: root_path, notice: "You are now following #{@user.name}!"
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_back fallback_location: root_path, notice: "You unfollowed #{@user.name}."
  end


end

