class AuthhenticationController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, notice: 'Успішно авторизовано!'
    else
      flash.now[:alert] = 'Неправильний логін або пароль.'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'Ви успішно вийшли з системи.'
  end

  private

  def authenticate_user!
    if !current_user.present?
      redirect_to login_path, notice: 'Будь ласка, увійдіть, щоб продовжити.'
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end