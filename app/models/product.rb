class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader
  belongs_to :category
  has_many :reviews
  
  validates :name, presence: true
  validates :price_cents, presence: true
  validates :quantity, presence: true
  validates :category_id, presence: true

end

    # t.string   "name"
    # t.text     "description"
    # t.string   "image"
    # t.integer  "price_cents"
    # t.integer  "quantity"
    # t.datetime "created_at",  null: false
    # t.datetime "updated_at",  null: false
    # t.integer  "category_id"