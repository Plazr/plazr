class Root::StoresController < Root::ApplicationController
  def index
    @stores = Store.all
  end
  def new
    @store=Store.new    
    @categorize = @store.categorizes.build
  end
  def create
    @store=Store.new(params[:store])
    respond_to do |format|
    if @store.save
      format.html { redirect_to root_store_path (@store), :notice => 'Store was successfully created.' }
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
    redirect_to root_stores_path
  end
  def show
    @store = Store.find(params[:id])
  end
  def update
    #raise params.inspect    
    @store = Store.find(params[:id])
    @store.update_attributes(params[:store])
    redirect_to root_store_path(@store)
  end
end
