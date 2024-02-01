class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # associations 
  has_and_belongs_to_many :blogs

end
