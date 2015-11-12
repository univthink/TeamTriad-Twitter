class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.text :bio
      t.string :email
      t.string :password
      t.integer :posts_ID

      t.timestamps null: false
    end
  end
end
