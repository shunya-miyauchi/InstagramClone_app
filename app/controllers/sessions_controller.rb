class SessionsController < ApplicationController
  skip_before_action :login_required,only: [:new,:create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to pictures_path
    else
      flash.now[:danger] = "ログイン失敗"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] = "ログアウト"
    redirect_to new_session_path
  end

end
