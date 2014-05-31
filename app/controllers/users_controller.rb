class UsersController < ApplicationController
  def index
    @users = User.limit(100)
  end

  def show
    @user = User.includes(:books).find(params[:id])
  end
end
