class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  
end

    # t.string   "name"
    # t.string   "email"
    # t.string   "password_digest"
    # t.datetime "created_at",      null: false
    # t.datetime "updated_at",      null: false
