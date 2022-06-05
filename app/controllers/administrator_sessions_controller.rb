require 'jwt'

class AdministratorSessionsController < ApplicationController
  def create
    if Administrator.find_by(userid: sessions_params[:userid])&.authenticate(sessions_params[:password])
      administrator = Administrator.find_by(userid: sessions_params[:userid])
      enable_administrator_cookie(administrator)
      head :ok
    else
      head :not_found
    end
  end

  def destroy
    cookies.encrypted[:session]&.delete
    head :ok
  end

  private

  def enable_administrator_cookie(administrator)
    jwt = JWT.encode(administrator.id, Rails.application.credentials.secret_key_base, 'HS512')
    cookies.encrypted[:session] = {
      value: jwt,
      expires: 1.week,
      secure: true,
      httponly: true
    }
  end

  def sessions_params
    params.require(:administrator).permit(:userid, :password)
  end
end
