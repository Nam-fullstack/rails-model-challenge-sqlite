class Director < ApplicationRecord
    has_many :films
    validates :name, length: 2..50
    validates :country, presence: true

    scope :active, -> { where(active: true) }
end
