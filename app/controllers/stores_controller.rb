class StoresController < ApplicationController
  def index
    @stores = Store.all
  end
  def new
    @store=Store.new
    @store.categorizings.build
  end
  def create
    #raise params.inspect
    @store=Store.new(params[:store])
    @store.save
    flash[:notice] = "Successfully Created store."
    redirect_to stores_path
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
