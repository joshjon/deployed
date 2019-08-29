class News < Item
  has_many :news_comments, dependent: :destroy
  has_many :comments, through: :news_comments
  default_scope -> { order(created_at: :desc) }

  # validation
  validates :title, presence: true, length: { minimum: 10, maximum: 200 }
  validates :by, presence: true
  validates :url, format: { with: %r{\Ahttps?://} }, allow_blank: true

  def comment_count
    comments.length
  end
end
