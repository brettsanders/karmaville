class UsersController < ApplicationController
  def index
    per_page = 50
    number_pages = User.count / per_page
    last_page = number_pages
    @current_page = params[:page].to_i

    if @current_page >= number_pages
      @current_page = last_page-1
    end

    low_page = @current_page - 4
    high_page = @current_page + 5

    if @current_page < 5
      low_page = 1
      high_page = 10
    end

    if (last_page-10..last_page).include?(@current_page) || @current_page > last_page
      low_page = last_page-10
      high_page = last_page-1
    end

    @users = User.by_karma.page(@current_page, per_page)
    @page_range = (low_page..high_page)
  end
end
