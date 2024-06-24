class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  def authenticate_admin!
    return invalid_authentication if payload.nil? || !AuthenticationTokenService.valid_payload(payload.first)

    current_user!
    non_admin_authentication unless @current_user.admin == true
  end

  def authenticate_request!
    puts payload
    # return invalid_authentication if payload.nil? || !AuthenticationTokenService.valid_payload(payload.first)

    current_user!
    invalid_authentication unless @current_user
  end

  def current_user!
    @current_user = User.find_by(id: payload[0]['user_id'])
  end

  def invalid_authentication
    
    render json: { error: 'Для початку потрібно авторизуватись' }, status: :unauthorized
  end

  def non_admin_authentication
    render json: { error: 'Лише адміністратор має доступ' }, status: :unauthorized
  end

  private

  def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    AuthenticationTokenService.decode(token)
  rescue StandardError
    nil
  end
end
