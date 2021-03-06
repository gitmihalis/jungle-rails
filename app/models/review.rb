class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  
  validates :description, presence: true,
                          length: { minimum: 8 }
  validates :rating, numericality: { less_than: 6, greater_than_or_equal_to: 0 }
  validates :product_id, numericality: { only_integer: true }
  validates :user_id, numericality: { only_integer: true }

end

    # t.integer  "product_id"
    # t.integer  "user_id"
    # t.string   "description"
    # t.integer  "rating"
    # t.datetime "created_at",  null: false
    # t.datetime "updated_at",  null: false
