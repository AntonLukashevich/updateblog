class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	mount_uploader :image, ImageUploader
	validates :title, presence: true,
                    length: { minimum: 5 }

	belongs_to :user
end
