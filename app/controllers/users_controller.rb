class UsersController < ApplicationController
  include BCrypt

  def new
    @user = User.new
    end

  def create
    end

end