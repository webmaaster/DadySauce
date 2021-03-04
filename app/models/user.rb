class User < ActiveRecord::Base
  has_secure_password
  email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #before_save :downcase
  #secrets our user has create
  has_many :secrets
  #enithing that ties our user to an object
  has_many :likes, dependent: :destroy
  #relationship betwen user to and secret they didn't create
  has_many :secrets_liked, through: :likes, source: :secret
  validates :name,presence:true, length:{in:2..20 }
  validates :email, presence:true,uniqueness: true, format:{with: email_regex}
  
end
