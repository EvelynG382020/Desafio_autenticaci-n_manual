class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :name, presence: true
    has_many :stories
end
