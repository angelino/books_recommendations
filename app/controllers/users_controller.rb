class UsersController < ApplicationController
  def show
    @user = User.includes(:books).find(params[:id])
  end
end
