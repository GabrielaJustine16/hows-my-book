class Book < ApplicationRecord
    #belongs_to :user
    belongs_to :category
    has_many :reviews
    has_many :users, through: :reviews
    #accepts_nested_attributes_for :user

    validates :category_id, :title, :description, :author, presence: true
    #scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(ratings) desc')}
    scope :ordered_by_title, -> { order(title: :asc) }
    def category_name=(name)
        self.category= Category.find_or_create_by(name: name)
      end
      
      def category_name
        self.try(:category).try(:name)
      end
end
