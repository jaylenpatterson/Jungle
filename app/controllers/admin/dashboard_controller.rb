class Admin::DashboardController < ApplicationController

   include HttpAuthConcern

     http_basic_authenticate_with name: ENV['ADMIN_VAL_USER'], password: ENV['ADMIN_VAL_PASS']

  def show
    @products_count = Product.count
    @category_count = Category.count
  end

end
