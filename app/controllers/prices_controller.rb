class PricesController < ApplicationController

  def index
    @list = Price.paginate(page: params[:page], per_page: 10)
  end

end
