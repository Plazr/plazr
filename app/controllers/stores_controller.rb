class StoresController < ApplicationController
  def index
    @stores = Store.all
  end
  def new
    # @json =Store.all.to_gmaps4rails
    @store=Store.new
    @categorize = @store.categorizes.build
  end
  def create
    # @json = Store.all.to_gmaps4rails
    @store= Store.new(params[:store])
    respond_to do |format|
    if @store.save
      format.html { redirect_to(@store, :notice => 'A sua loja foi criada com sucesso.') }
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
