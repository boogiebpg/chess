class Admin::PricesController < ApplicationController

  helper_method :resource

  def index
    @list = Price.paginate(page: params[:page], per_page: 10)
  end

  def new
    @price = Price.new
  end

  def create
    Price.create params[:price]
    # @price.save!

    flash[:notice] = "Added successfully"

    redirect_to admin_prices_url
  end

  def edit
    # @price = Price.find(params[:id])
  end

  def update
    @price = resource
    @price.update_attributes params[:price]

    flash[:notice] = "Edited successfully"

    redirect_to admin_prices_url
  end

  def destroy
    i = Price.find(params[:id])
    i.destroy
    flash[:notice] = "#{i.name} was deleted"
    redirect_to admin_prices_url
  end

  def resource
    Price.find(params[:id])
  end

end
