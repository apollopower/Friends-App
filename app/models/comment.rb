class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :channel

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :channel_id, presence: true
  validates :content, presence: true, length: { maximum: 280 }
end
