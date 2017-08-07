require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      name: "Arnold Facepalmer",
      email: "golfLord@hotmail.com",
      password: 'foobar',
      password_confirmation: 'foobar'
    )
    end

  describe("Validations") do
    it "should not save when created without a password" do
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

    it "should have a unique email that is case insensitive" do
      @user.save!
      email = @user.email.upcase
      @user_with_same_email = User.new(
        name: "Arnie Punchloaf",
        email: email,
        password: 'foobar',
        password_confirmation: 'foobar'
      )
      @user_with_same_email.save

      expect(@user_with_same_email.errors.full_messages).to include("Email has already been taken") 
    end

    it "should have a password longer than 5 characters" do
      pw = '12345'
      @user.password = pw
      @user.password_confirmation = pw
      @user.save

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe ".authenticate_with_credentials" do
    # examples for this class method
    it "should return true if email and password are in db" do
      @user.save
      auth = @user.authenticate_with_credentials(@user.email, @user.password)
      expect(auth).to be true
    end
  end
end
