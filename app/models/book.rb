class Book < ApplicationRecord
  belongs_to :category
  has_many :reviews 
  has_many :users, through: :reviews
  accepts_nested_attributes_for :reviews,:reject_if => :all_blank
    
  validates :category_id, :title, :description, :author, presence: true
  scope :ordered_by_title, -> { order(title: :asc) }
  
      
  def category_name
    self.try(:category).try(:name)
  end
end
