class Book < ApplicationRecord
  scope :top_ten, -> { order(rank: :asc).limit(10) }
end
