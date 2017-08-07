class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates_confirmation_of :password
  
end

    # t.string   "name"
    # t.string   "email"
    # t.string   "password_digest"
    # t.datetime "created_at",      null: false
    # t.datetime "updated_at",      null: false
