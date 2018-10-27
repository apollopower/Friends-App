require 'securerandom'

class Channel < ApplicationRecord

    has_and_belongs_to_many :users

    before_save :generate_slug

    validates :title, presence: true, length: { maximum: 50 }
    validates :slug, uniqueness: true


    private

    def generate_slug
        self.slug = SecureRandom.urlsafe_base64
    end
end
