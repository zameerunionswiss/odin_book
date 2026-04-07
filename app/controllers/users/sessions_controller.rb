class Users::SessionsController < Devise::SessionsController
  before_action :redirect_if_signed_in, only: [:new, :create]


  private

  def redirect_if_signed_in
    redirect_to user_path(current_user) if user_signed_in?
  end
end