class SessionsController < ApplicationController
  #GET /sessions/new
  def new
    respond_to do |format|
      format.html
      format.json { render action: 'new', status: :ready_to_login }
    end
  end

  #POST /sessions
  def create
    if user = User.where(nick: params[:nick], pass: params[:pass]).first
      session[:user_id] = user.id
      respond_to do |format|
        format.html {
        redirect_to users_path }
        format.json { render action: 'User.show', status: :logged_in, location: @user }
      end
    else
      respond_to do |format|
        format.html { redirect_to new_session_path, notice: t("session.failed-to-login") }
        format.json { render action: 'new', status: :failed }
      end
    end
  end

  #DELETE /sessions
  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to new_session_path }
      format.json { render action: 'new', status: :logged_out }
    end
  end
end
