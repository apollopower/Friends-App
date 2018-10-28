class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :channels

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { minimum: 2 }
  validates :user_id, presence: true
  
end
