class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
                               password: ENV["HTTP_BASIC_PASSWORD"],
                               if: -> { ENV["HTTP_BASIC_PASSWORD"].present? }
  
  def show
    @number_products = Product.all.count
    @number_categories = Category.all.count
  end
end
