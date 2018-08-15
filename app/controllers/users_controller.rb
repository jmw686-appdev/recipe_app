class UsersController < ApplicationController

  def index
    @users = User.all
    render 'users/index'
  end

  def show
    render 'users/show'
  end
end
