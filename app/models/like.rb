class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :secret
  validates :user_id, uniqueness: {scope: :secret_id}
end
