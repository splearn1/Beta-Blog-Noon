class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  # associations 
  has_and_belongs_to_many :categories

end