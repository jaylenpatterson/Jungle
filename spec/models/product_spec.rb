require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "Creates new product if product is valid" do
      @category = Category.new(name: 'food')
      @product = Product.new(name: "ice", price: 50, quantity:2000, :category => @category)
      expect(@product.valid?).to eql(true)
    end

     it "won't create a new product if name is missing" do
      @category = Category.new(name: 'food')
      @product = Product.new(price: 50, quantity:2000, :category => @category)
      expect(@product.valid?).to eql(false)
    end

     it "won't create a new product if price is missing" do
      @category = Category.new(name: 'food')
      @product = Product.new(name: "ice", quantity:2000, :category => @category)
      expect(@product.valid?).to eql(false)
    end

     it "won't create a new product if quantity is missing" do
      @category = Category.new(name: 'food')
      @product = Product.new(name: "ice", price: 50, :category => @category)
      expect(@product.valid?).to eql(false)
    end

     it "won't create a new product if category is missing" do
      @category = Category.new(name: 'food')
      @product = Product.new(name: "ice", price: 50, quantity:2000)
      expect(@product.valid?).to eql(false)
    end
   
    
  end
end
