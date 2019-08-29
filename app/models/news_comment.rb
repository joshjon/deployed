class NewsComment < ApplicationRecord
  belongs_to :news
  belongs_to :comment
  default_scope -> { order(created_at: :desc) }
end
