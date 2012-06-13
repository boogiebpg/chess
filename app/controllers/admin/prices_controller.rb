class Admin::PricesController < Admin::CommonController

  helper_method :resource

  def index
    @list = Price.paginate(page: params[:page], per_page: 10)
  end

  def new
    @price = Price.new
  end

  def create
    @p = Price.create params[:price]
    # @price.save!

    flash[:notice] = t("notice.step1_ok")

    # redirect_to edit_admin_price_url(@p, anchor: "pictures")
    redirect_to add_pictures_admin_price_url(@p)
  end

  def edit
    # @price = Price.find(params[:id])
    @object_new = Picture.new
  end

  def add_pictures
    @object_new = Picture.new    # needed for form_for --> gets the path
  end

  def update
    @price = resource
    @price.update_attributes params[:price]

    flash[:notice] = t("notice.updated_ok")

    redirect_to edit_admin_price_url params[:id]
  end

  def destroy
    i = Price.find(params[:id])
    i.destroy
    flash[:notice] = t("notice.deleted_ok", :name => i.name)
    redirect_to admin_prices_url
  end

  def resource
    Price.find(params[:id])
  end

end
