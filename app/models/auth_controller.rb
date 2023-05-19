class AuthController < ApplicationController
    def signup
      user = User.new(user_params)
      if user.save
        render json: { message: 'Signup successful' }
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def login
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        token = encode_token(user_id: user.id)
        render json: { token: token }
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:username, :email, :password, :password_confirmation)
    end
  
    def encode_token(payload)
      JWT.encode(payload, Rails.application.secret_key_base)
    end
  end