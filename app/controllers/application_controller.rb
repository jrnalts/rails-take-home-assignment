class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_token])
  end

  def user_signed_in?
    current_user != nil
  end

  def authenticate_user!
    redirect_to root_path, notice: '請登入會員' unless user_signed_in?
  end

  def user_track_lists
    current_user.track_lists
  end

  def not_found
    render file: "#{Rails.root}/public/404.html",
           status: 404,
           layout: false
  end
end
