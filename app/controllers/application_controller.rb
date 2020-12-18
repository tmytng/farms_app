# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path
  end
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user
  # before_action :set_search

  protected

  def configure_permitted_parameters
    added_attrs = %i[name email avatar password password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def set_user
    @user = current_user if user_signed_in?
  end

  # def set_search
  #   @q = Post.ransack(params[:q])
  #   @results = @q.result
  # end
end
