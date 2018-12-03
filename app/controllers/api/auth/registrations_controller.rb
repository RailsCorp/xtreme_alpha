module Api
  module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      protect_from_forgery except: :create
      # deviseのメソッドをオーバーライド

      private

      def sign_up_params
        params.permit(
          :name,
          :email,
          :uid,
          :password,
          :password_confirmation,
          :reset_password_token
        )
      end
 
      def account_update_params
        params.permit(
          :name,
          :email
        )
      end
    end
  end
end
