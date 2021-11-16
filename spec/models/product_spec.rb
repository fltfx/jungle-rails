require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save' do
      @category = Category.new(name: "Food")
      @product = Product.new(name: "Banana", price: "50000", quantity: "12", category: @category)
  
      expect(@product.save).to eq true
    end

    it "should not be valid when there is no name" do
      @category = Category.new(name: "Food")
      @product = Product.new(price: "50000", quantity: "12", category: @category) #name: nil - this is bad practice
      expect(@product.save).to eq false
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not be valid when there is no price" do
      @category = Category.new(name: "Food")
      @product = Product.new(name: "Banana", quantity: "12", category: @category) #name: nil - this is bad practice
      expect(@product.save).to eq false
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should not be valid when there is no quantity" do
      @category = Category.new(name: "Food")
      @product = Product.new(name: "Banana", price: "50000", category: @category) #name: nil - this is bad practice
      expect(@product.save).to eq false
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not be valid when there is no category" do
      @category = Category.new(name: "Food")
      @product = Product.new(name: "Banana", price: "50000", quantity: "12") #name: nil - this is bad practice
      expect(@product.save).to eq false
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
