class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present?
      session[:user_id] = user.id
      redirect_to new_course_path
    else
      flash[:notice] = "Username or password incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
