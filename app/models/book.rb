class Book < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :reveiws
end
