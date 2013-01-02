class StoresController < ApplicationController
  def index
    
    @store_categories = StoreCategory.where("parent IS NOT ?",nil)

    if params[:search] && params[:search]!='All'
      
      @stores = []

      Store.all.each do |s|
        if(s.store_categories.exists?(params[:search]))
          @stores.push(s)
        end
      end

    else
      if params[:keyword] && !params[:keyword].blank?
        @stores = []

        Store.all.each do |s|
          if( s.name.upcase.include?(params[:keyword].upcase) || 
              s.description.upcase.include?(params[:keyword].upcase) || 
              s.url.upcase.include?(params[:keyword].upcase)
              )
            @stores.push(s)
          end
        end
      else
        @stores = Store.all
      end
    end

  end
  def new
    @store=Store.new    
    @categorize = @store.categorizes.build
  end
  def create
    @store=Store.new(params[:store])
    respond_to do |format|
    if @store.save
      format.html { redirect_to store_path (@store), :notice => 'Store was successfully created.' }
    else
      format.html { render :action => "new" }
    end
  end
      
  end
  def edit
    @store = Store.find(params[:id])      
  end
  def destroy
    @store = Store.find(params[:id])  
    @store.destroy
    redirect_to stores_path
  end
  def show
    @store = Store.find(params[:id])
  end
  def update
    #raise params.inspect    
    @store = Store.find(params[:id])
    @store.update_attributes(params[:store])
    redirect_to store_path(@store)
  end
end
