class Item < ApplicationRecord
  scope :news, -> { where(type: 'news') }
  scope :comment, -> { where(type: 'comment') }
end
