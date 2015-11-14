class AddPasswordSaltAndCryptedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_salt, :string
    add_column :users, :crypted_password, :string
  end
end
