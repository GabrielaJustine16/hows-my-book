class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user
    accepts_nested_attributes_for :book
    validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

    #scope :alpha, -> {order(:rating)}
end
