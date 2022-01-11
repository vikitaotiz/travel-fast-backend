class Api::V1::AuthController < ApplicationController
  def signup
    @user = User.new(signup_params)

    if @user.save
      render json: { message: 'Signup successfully', data: @user }, status: :created
    else
      render json: { message: 'User already exists' }, status: :unauthorized
    end
  end

  private

  def signup_params
    params.require(:auth).permit(:name, :email, :username)
  end
end
