class Film < ApplicationRecord
  belongs_to :director
  validates :title, presence: true
  validates :description, length: 10..250
  validates :year, numericality: { greater_than_or_equal_to: 1900 }
  validates :genre, presence: true

  scope :crime, -> { where(genre: "crime") }
  scope :drama, -> { where(genre: "drama") }
end
