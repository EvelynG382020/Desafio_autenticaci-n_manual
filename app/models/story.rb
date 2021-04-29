class Story < ApplicationRecord
  belongs_to :user
  validates :title, :picture, :content, presence: true
end
