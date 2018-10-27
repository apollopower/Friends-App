class Channel < ApplicationRecord

    has_and_belongs_to_many :users

    validates :title, presence: true, length: { maximum: 50 }
end
