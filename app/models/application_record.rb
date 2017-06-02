class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :ordered_by_desc, -> { order(created_at: :desc) }
  scope :sorted_recent, -> { ordered_by_desc.limit(5) }
end
