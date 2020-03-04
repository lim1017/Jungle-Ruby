class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_KEY'], password: ENV['ADMIN_PW']


  def show


    @count = Product.all.count()
    @countCategories=Category.all.count()



  end
end
