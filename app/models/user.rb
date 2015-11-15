class User < ActiveRecord::Base

  acts_as_authentic
  acts_as_followable
  acts_as_follower

  acts_as_authentic do |c|
      c.login_field = 'email'
  end



  validates_presence_of :name, :username, :email, :bio
  validates :bio, length: { minimum: 20 }
  validates :username, length: { minimum: 5 }

  has_many :posts


end
