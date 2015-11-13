class User < ActiveRecord::Base

  validates_presence_of :name, :username, :email, :bio
  validates :bio, length: { minimum: 20 }
  validates :username, length: { minimum: 5 }

  has_many :posts

end
