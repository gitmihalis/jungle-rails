class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates_confirmation_of :password

  def authenticate_with_credentials(email, password)
    authenticate(password) && self.email == email
  end 
  
end

    # t.string   "name"
    # t.string   "email"
    # t.string   "password_digest"
    # t.datetime "created_at",      null: false
    # t.datetime "updated_at",      null: false
