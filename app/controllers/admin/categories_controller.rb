class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"] 
  
  def index
    @category = Category.order(:name).all
  end

  def new
    @category = Category.new
  end 

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Category created!"
    else
      render :new,  alert: "Failed to create new category."
    end
  end 

  private

  def category_params
   params.require(:category).permit(
     :name
   )
  end




end
