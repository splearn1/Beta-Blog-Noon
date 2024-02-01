class Blog < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  # associations 
  has_and_belongs_to_many :categories

end


# associations - many-to-many relationships

# has_and_belongs_to_many 
  #  - does not require a third model(join table)

# has_many, :through
  #  - requires a third model(join table)

# many-to-many examples 
# - doctors and patients 
# - students and courses
# - books and authors 