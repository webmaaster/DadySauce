class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :liked, through: :likes, source: :user
end
