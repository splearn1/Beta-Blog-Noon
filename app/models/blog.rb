class Blog < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  # associations 
  has_and_belongs_to_many :categories

  has_one_attached :cover_image

  has_many :likes, as: :likeable

  def cover_image_url 
    rails_blob_url(self.cover_image, only_path: false) if self.cover_image.attached?
  end

end