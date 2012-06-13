class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
