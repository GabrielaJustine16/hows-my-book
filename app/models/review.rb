class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book, required: false
    #accepts_nested_attributes_for :book
    validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
    #validates_presence_of :book

end
