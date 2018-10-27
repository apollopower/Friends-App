class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :channels

  validates :content, presence: true, length: { minimum: 2 }
  validates :user_id, presence: true
end
