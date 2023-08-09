class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.includes(:items, :categories)
  end

  # def show
  # end

  # def logout
  #   sign_out(current_user) # Devise method to sign out the user
  #   redirect_to root_path, notice: 'Logged out successfully'
  # end

end
