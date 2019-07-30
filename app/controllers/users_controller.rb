class UsersController < ApplicationController
    
  # skip_before_action :authorize, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
      user = User.create( user_params )
      if user.valid?
          render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id) }, status: :created
      else
          render json: { errors: user.errors.full_messages }, status: :not_accepted
      end
  end

  private 

  def user_params
      params.require(:user).permit(:email, :password)
  end
end