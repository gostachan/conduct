class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
end
