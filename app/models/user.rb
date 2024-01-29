class User < ApplicationRecord
    has_many :blogs
    has_one :profile
    after_create :create_profile

    validates :first_name, presence: true
    validates :email, presence: true
    validates :username, presence: true
end
