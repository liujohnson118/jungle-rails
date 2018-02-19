class SessionsController < ApplicationController

def new
end

def create
  user = User.find_by(email: session_params[:email])
  if user && user.authenticate(session_params[:password])
    session[:user_id] = user.id
    puts 'success in login'
    redirect_to '/'
  else
    redirect_to '/login'
  end
end

def destroy
  session[:user_id] = nil
  redirect_to '/login'
end

private
def session_params
  params.require(:session).permit(
    :email,
    :password
    )
end

end
