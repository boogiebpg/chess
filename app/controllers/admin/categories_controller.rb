class Admin::CategoriesController < Admin::CommonController

  def new
    
  end

  def create
    Category.create name: "new"
    redirect_to admin_categories_url
  end

  def save
    cat_id = params[:id][/category_(\d+)/, 1]
    c = Category.find cat_id
    c.name = params[:value]
    c.save!

    render :text => c.name
  end

  def save_all
    # text = ""
    params[:li].each do |p|
      Rails.logger.info "------- #{p.inspect}"
      c = Category.find p.first.to_i
      p.second.to_i > 0 ? c.parent_id = p.second.to_i : c.parent_id = nil
      c.save!
      # text += c.name
    end

    render :text => "saved"
  end

  def destroy
    c = Category.find params[:id]
    c.destroy

    flash[:notice] = t("notice.cat_deleted_ok", :name => c.name)

    redirect_to admin_categories_path
  end

end
