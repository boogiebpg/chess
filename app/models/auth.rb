class Auth < ActiveRecord::Base
  attr_accessible :name, :password

  def self.draw_admin_menu
    return "hello"
  end

end
