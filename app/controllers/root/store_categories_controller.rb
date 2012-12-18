class Root::StoreCategoriesController < Root::ApplicationController
  def index
    @categories  = StoreCategory.all
  end    
  def new
    @category = StoreCategory.new
  end
  def create
    @category = StoreCategory.new(params[:store_category])
    @category.save
    redirect_to(root_store_categories_path)
  end
  def show
    #@categories  = StoreCategory.all
    @category = StoreCategory.find(params[:id])
    @subcategories = StoreCategory.where("parent = ?", @category.id)
  end
  def edit
    @category = StoreCategory.find(params[:id])
  end
  def update
    @category = StoreCategory.find(params[:id])
    @category.update_attributes(params[:store_category])
    redirect_to(root_store_category_path(@category))
  end
  def destroy
    @category = StoreCategory.find(params[:id])
    @category.destroy
    redirect_to(root_store_categories_path)
  end
end
