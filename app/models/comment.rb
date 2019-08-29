class Comment < Item
  validates :text, presence: true, length: { minimum: 3, maximum: 1000 }
  validates :by, presence: true
  default_scope -> { order(created_at: :desc) }
end
