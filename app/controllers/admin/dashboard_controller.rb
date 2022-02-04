class Admin::DashboardController < ApplicationController
  ENV["HTTP_BASIC_PASSWORD"]
  def show
    @product_count = Product.count
    @category_count = Category.count

  end
end
