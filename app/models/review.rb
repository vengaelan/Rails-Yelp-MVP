class Review < ApplicationRecord
  validates :rating, inclusion: 0..5, numericality: { only_integer: true }
  validates :content, presence: true
  belongs_to :restaurant
end
