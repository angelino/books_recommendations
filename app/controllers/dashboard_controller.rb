class DashboardController < ApplicationController
  def index
    @books = BooksMostRead.new.the_most_read
  end
end
