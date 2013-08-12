class UsersController < ApplicationController
  def index
    # @users = User.by_karma.limit(50)
    @users = User.order('karma_total DESC').limit(50)
  end
end
