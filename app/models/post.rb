class Post < ApplicationRecord

  belongs_to :user
  belongs_to :channel
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { minimum: 2, maximum: 1120 }
  validates :user_id, presence: true
  validates :channel_id, presence: true
  
end
