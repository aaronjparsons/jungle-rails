require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.new(name: "Game")

  describe 'Validations' do
    it "is valid with valid attributes" do
      @product = Product.new(name: "Anything", price: 12, quantity: 20, category: category)
      expect(@product).to be_valid
      expect(@product.errors.empty?).to be true
    end

    it "is not valid without a name" do
      @product = Product.new(name: nil, price: 12, quantity: 20, category: category)
      expect(@product).to_not be_valid
      expect(@product.errors.empty?).to_not be true
    end

    it "is not valid without a price" do
      @product = Product.new(name: "Anything", price: nil, quantity: 20, category: category)
      expect(@product).to_not be_valid
      expect(@product.errors.empty?).to_not be true
    end

    it "is not valid without a quantity" do
      @product = Product.new(name: "Anything", price: 12, quantity: nil, category: category)
      expect(@product).to_not be_valid
      expect(@product.errors.empty?).to_not be true
    end

    it "is not valid without a category" do
      @product = Product.new(name: "Anything", price: 12, quantity: 20, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.empty?).to_not be true
    end

  end
end
