require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(:name => "Flowers")
    end
    
    it "new init product to be true" do
      @product = Product.new(:name => "Rose", :price_cents => 20, :quantity => 10, :category => @category)
      expect(@product.valid?).to be true
    end

    it "returns 'Name can't be blank' when name is nil" do
      @product = Product.new(:name => nil, :price_cents => 20, :quantity => 10, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "returns 'Price can't be blank' when price_cents is nil" do
      @product = Product.new(:name => "Rose", :price_cents => nil, :quantity => 10, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "returns 'Quantity can't be blank' when quantity is nil" do
      @product = Product.new(:name => "Rose", :price_cents => 20, :quantity => nil, :category => @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "returns 'Category can't be blank' when category is nil" do
      @product = Product.new(:name => "Rose", :price_cents => 20, :quantity => 10, :category => nil)
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
