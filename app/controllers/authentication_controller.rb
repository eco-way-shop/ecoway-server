class AuthenticationController < ApplicationController
      class AuthenticateError < StandardError; end

      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticateError, with: :handle_unauthenticated

      def create
        if user && user.authenticate(params.require(:password))
          # Successful login
          session[:user_id] = user.id  # Store user ID in session (optional)
          redirect_to cars_path
        else
          # Authentication failed or user not found
          render json: { error: user ? 'Invalid credentials' : 'No such user' }, status: :unauthorized
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
