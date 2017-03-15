class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :ordered_by_desc, -> { order(created_at: :desc) }
  scope :latest, -> { limit(10) }
end
