class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  
  validates :description, presence: true,
                          length: { minimum: 8 }
  validates :rating, numericality: { less_than: 6, greater_than_or_equal_to: 0 }


end
