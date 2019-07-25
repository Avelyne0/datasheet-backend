class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
 
  def index
    @users = User.all
    render json: @users , except: [:created_at, :updated_at]
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end
 
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end