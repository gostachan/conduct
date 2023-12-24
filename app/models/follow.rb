class Follow < ApplicationRecord
  validates :following_user_id, presence: true
  validates :followed_user_id, presence: true
end
