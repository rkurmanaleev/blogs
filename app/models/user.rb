class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :avatar_image, content_type: ["image/jpeg", "image/png", "image/gif", "image/jpg"]

  scope :with_posts, -> { where("posts_count > 0") }
  scope :order_by_posts, -> { order(posts_count: :desc) }
end
