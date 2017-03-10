class Post < ApplicationRecord
  validates :title, length: { minimum: 5 }, presence: true
  validates :content, length: { minimum: 8 }, presence: true

  belongs_to :user
end
