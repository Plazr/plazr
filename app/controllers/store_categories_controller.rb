class StoreCategoriesController < ApplicationController
  def index
    @categories  = StoreCategory.all
  end    
  def new
    @category = StoreCategory.new
  end
  def create
    @category = StoreCategory.new(params[:store_category])
    @category.save
    redirect_to store_categories_path
  end
  def show
    @category = StoreCategory.find(params[:id])
  end
  def edit
    @category = StoreCategory.find(params[:id])
  end
  def update
    @category = StoreCategory.find(params[:id])
    @category.update_attributes(params[:store_category])
    redirect_to(store_category_path(@category))
  end
  def destroy
    @category = StoreCategory.find(params[:id])
    @category.destroy
    redirect_to(store_categories_path)
  end
end
