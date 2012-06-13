class Admin::AuthController < Admin::CommonController

  def show
    @auth = (Auth.count == 1 ? Auth.first : Auth.create)
  end

  def update

    if Auth.count == 1
      a = Auth.first
    else
      a = Auth.create
    end

    a.update_attributes name: params[:auth][:name], password: params[:auth][:password]
    a.save!

    flash[:notice] = t("notice.password_update_ok")

    redirect_to admin_auth_path(1)
  end

end
