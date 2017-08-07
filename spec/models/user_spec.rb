require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      name: "Arnold Facepalmer",
      email: "goldlord@hotmail.com"
    )
    end

  describe("Validations") do
    it "should not save when created without a password" do
      password = 'foobar'
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not save if password_confirmation does not match password" do
      password = "foobar"
      @user.password = password
      @user.password_confirmation = "f00bar"
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    
  end
end
