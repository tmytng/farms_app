# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    prepend_before_action :require_no_authentication, only: [:cancel]
    prepend_before_action :authenticate_scope!, only: %i[edit update]
    prepend_before_action :set_minimum_password_length, only: %i[edit]
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    before_action :creatable?, only: %i[new create]
    before_action :editable?, only: %i[edit update]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    def edit
      if by_admin_user?(params)
        self.resource = resource_class.to_adapter.get!(params[:id])
      else
        authenticate_scope!
        super
      end
    end

    # PUT /resource
    def update
      self.resource = if by_admin_user?(params)
                        resource_class.to_adapter.get!(params[:id])
                      else
                        resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
                      end

      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      resource_updated = if by_admin_user?(params)
                           update_resource_without_password(resource, account_update_params)
                         else
                           update_resource(resource, account_update_params)
                         end

      yield resource if block_given?
      if resource_updated
        if is_flashing_format?
          flash_key = if update_needs_confirmation?(resource, prev_unconfirmed_email)
                        :update_needs_confirmation
                      else
                        :updated
                      end
          set_flash_message :notice, flash_key
        end
        bypass_sign_in resource, scope: resource_name unless by_admin_user?(params)
        respond_with resource, location: after_update_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile position])
    end

    def by_admin_user?(params)
      params[:id].present? && current_user_is_admin?
    end

    def current_user_is_admin?
      user_signed_in? && current_user.has_role?(:admin)
    end

    # The path used after sign up.
    def after_sign_up_path_for(resource)
      if current_user_is_admin?
        users_path
      else
        super(resource)
      end
    end

    # The path used after update.
    def after_update_path_for(resource)
      if current_user_is_admin?
        flash[:notice] = '更新が完了しました'
        users_path
      else
        flash[:notice] = 'ユーザー情報の更新が完了しました'
        super(resource)
      end
    end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    def sign_up(resource_name, resource)
      sign_in(resource_name, resource) unless current_user_is_admin?
    end

    def update_resource_without_password(resource, params)
      resource.update_without_password(params)
    end

    def creatable?
      raise CanCan::AccessDenied unless user_signed_in?

      raise CanCan::AccessDenied unless current_user_is_admin?
    end

    def editable?
      raise CanCan::AccessDenied unless user_signed_in?
    end
  end
end
