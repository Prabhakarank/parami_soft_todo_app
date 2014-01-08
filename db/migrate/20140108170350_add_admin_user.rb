class AddAdminUser < ActiveRecord::Migration
  def change
    u = User.new
    u.email = "admin@parami.com"
    u.password = "password"
    u.roles = "admin"
    u.save!
  end
end
