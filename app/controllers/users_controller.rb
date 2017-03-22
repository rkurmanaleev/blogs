class UsersController < ApplicationController
  before_action :authenticate_user!
  expose_decorated(:user)
end
