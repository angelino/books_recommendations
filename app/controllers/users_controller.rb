class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per_page(20)
  end

  def show
    @user = User.includes(:books).find(params[:id])
  end
end
