require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before (:each) do
      @category = Category.new(name: "category1")
    end

    it 'the product has all' do
      @product = Product.new(name: "testProduct1", price_cents: 20, quantity: 20, category: @category)
      @product.save
      expect(@product).to be_present
    end

    it 'the product has a name' do
      @product = Product.new(name:nil, price_cents: 20, quantity: 20, category: @category)
      @product.save
      expect(@product.errors_full_messages).to include("Name cannot be blank")
  end

  it 'the product has a price' do
    @product = Product.new(name: "testProduct1", price_cents: nil, quantity: 20, category: @category)
    @product.save
    expect(@product.errors_full_messages).to include("price must be a number")
  end

  it 'the product has a quantity' do
    @product = Product.new(name: "testProduct1", price_cents: 20, quantity: nil, category: @category)
    @product.save
    expect(@product.errors_full_messages).to include("quantity must be a number")
  end
  it 'the product has a category' do
    @product = Product.new(name: "testProduct1", price_cents: 20, quantity: 20, category: nil)
    @product.save
    expect(@product.errors_full_messages).to include("the product must have a category")
  end
end
end