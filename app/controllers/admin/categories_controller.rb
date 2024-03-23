class Admin::CategoriesController < ApplicationController
  def index
	@Categories = Category.all
	@Category = Category.new
  end

  def create
	category = Category.new(category_params)
	if category.save
		redirect_to admin_categories_path
	else
		redirect_to admin_categories_path
	end
  end

  def update
  end

  def destroy
	category = Category.find(params[:id])
	category.delete
	redirect_to admin_categories_path
  end

    private
	def category_params
		params.require(:category).permit(:label)
	end
end
