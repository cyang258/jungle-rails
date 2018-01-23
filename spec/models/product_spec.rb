require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'furniture')
    end

    it 'should be vaild if it has all attributes' do
      @product = Product.new(name: 'matress', price: 100, quantity: 4, category: @category)
      expect(@product.valid?).to be true
    end

    it 'should be invaild if it does not have name' do
      @product = Product.new(price: 100, quantity: 4, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should be invaild if it does not have price' do
      @product = Product.new(name: 'matress', quantity: 4, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should be invaild if it does not have quantity' do
      @product = Product.new(name: 'matress', price: 100, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should be invaild if it does not have category' do
      @product = Product.new(name: 'matress', price: 100, quantity: 4)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
