class UsersController < ApplicationController

  def index
    @users = User.all
    render 'users/index'
  end

  def recipe_index
    render 'users/recipe_index'
  end

  def show
    render 'users/show'
  end
end
