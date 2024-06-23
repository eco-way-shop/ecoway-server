class AuthenticationController < ApplicationController
      class AuthenticateError < StandardError; end

      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticateError, with: :handle_unauthenticated

      def create
        if user
          raise AuthenticateError unless user.authenticate(params.require(:password))
          logged_user =  AuthenticateRepresenter.new(user).as_json
          if logged_user.present?          
            redirect_to cars_path
          end
        else
          render json: { error: 'Такого користувача немає' }, status: :unauthorized
        end
      end

      private

      def user
        @user ||= User.find_by(username: params.require(:username))
      end

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end

      def handle_unauthenticated
        render json: { error: 'Хибний пароль' }, status: :unauthorized
      end

end
