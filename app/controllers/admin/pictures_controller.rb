class Admin::PicturesController < Admin::CommonController

  def index
    @pictures = price.pictures
    render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
  end

  def new
    @object_new = Picture.new    # needed for form_for --> gets the path
  end

  def create
    @picture = price.pictures.new
    @picture.avatar = params[:picture][:path]
    if @picture.save
      respond_to do |format|
        format.html {                                         #(html response is for browsers using iframe sollution)
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    render :json => true
  end

  protected
  def price
    @price ||= Price.find(params[:price_id])
  end

end
