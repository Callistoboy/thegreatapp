class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user
      else
        flash.now[:danger] = t('views.session.error_password')
        render 'new'
      end
    else
      flash.now[:danger] = t('views.session.error_email')
      render 'new'
    end
  end

  def delete
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
