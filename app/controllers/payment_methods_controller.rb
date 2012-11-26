class PaymentMethodsController < ApplicationController
  def index
    @payment_methods = PaymentMethod.all
  end
  def new
    @payment_method = PaymentMethod.new
  end
  def create
    @payment_method = PaymentMethod.new(params[:payment_method])
    @payment_method.save
    redirect_to payment_methods_path
  end
  def show
    @payment_method = PaymentMethod.find(params[:id])
  end
  def edit
    @payment_method = PaymentMethod.find(params[:id])
  end
  def update
    @payment_method = PaymentMethod.find(params[:id])
    @payment_method.update_attributes(params[:payment_method])
    redirect_to(payment_method_path(@payment_method))
  end
  def destroy
    @payment_method = PaymentMethod.find(params[:id])
    @payment_method.destroy
    redirect_to(payment_methods_path)
  end
end
