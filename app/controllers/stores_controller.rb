class StoresController < ApplicationController

  before_filter :check_admin, only: [:new, :edit, :destroy]


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
    # @json =Store.all.to_gmaps4rails
    @store=Store.new
    @store.get_unselected_categories
  end


  def create
    # @json = Store.all.to_gmaps4rails
    @store= Store.new(params[:store])
    # @store = Store.new
    # @categorize = @store.categorizes.build
    respond_to do |format|
    if @store.save

      ## script local
      system('sh ../shared/create_store_local.sh '+@store.name.to_s.parameterize+' '+@store.id.to_s)
      ## script global
      #system('sh ../shared/create_store.sh '+@store.name.to_s.parameterize+' '+@store.id.to_s)

  	  #unless current_user.roles.detect { |role| role.name == 'admin' }
      #	current_user.roles << PlazrAuth::Role.find_by_name('admin')
      #end

	  new_role = PlazrAuth::Role.create name: "admin_#{@store.id}"
	  current_user.roles << new_role

      format.html { redirect_to store_path (@store), :notice => 'Store was successfully created.' }

      format.html { redirect_to(@store, :notice => 'A sua loja foi criada com sucesso.') }
    else
      @store.get_unselected_categories
      format.html { render :action => "new" }
    end



  end

  end
  def edit
    @store = Store.find(params[:id])
    @store.get_unselected_categories
  end
  def destroy
    @store = Store.find(params[:id])
    system("kill -9 `lsof -wni tcp:30"+@store.id.to_s+" | grep ruby | awk '{ print  $2 }'`")
    system("rm -rf ../plazr_stores/"+@store.id.to_s+"_"+@store.name.to_s.parameterize)
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


  protected

    def check_admin
      unless can? :create, :store
        flash[:error] = 'You don\'t have permission to access this'
        redirect_to root_path
      end
    end
end
