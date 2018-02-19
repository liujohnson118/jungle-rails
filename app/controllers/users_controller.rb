class UsersController < ApplicationController

def new
end
def create
  if User.new(user_params).save
    redirect_to '/'
  else
    redirect_to '/signup'
  end
end
private

def user_params
  params.require(:user).permit(
    :name,
    :email,
    :password
    )
end
end
