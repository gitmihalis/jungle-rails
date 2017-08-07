require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do

    before :each do
      @category = Category.create(name: 'Oddities')
      @product = @category.products.build(
        name: 'Sunbrero',
        description: "Excepteur ullamco irure excepteur amet.",
        price_cents: 1900,
        quantity: 99
      )
    end

    it 'saves with valid fields' do
      @product.save

      expect(@product).to be_valid
    end

    it "validates precense of name" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "validates precense of price" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end

    it "validates precense of quantity" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "validates precense of :category" do
      @product.category_id = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end


