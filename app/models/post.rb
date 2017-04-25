class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy

  acts_as_ordered_taggable
end
