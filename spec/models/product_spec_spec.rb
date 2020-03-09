require 'rails_helper'
require 'spec_helper'
require 'product'



  RSpec.describe Product, type: :model do
    describe 'Validations' do
      
      product1 = Product.new(
        name: "new",
        price: 500,
        quantity: 100,
        category: Category.new(name:"Cars")
      )

      it 'should have a name/price/quantity/category' do
        @product = product1
    
        puts @product
        expect(@product).to be_valid

      end

      it 'should have a name' do
        @product = product1
        @product[:name] = nil
        expect(@product).to_not be_valid

      end

      it 'should have a price' do
       category=Category.new(name:"drink")
       product=Product.new(name: "new", price: nil, quantity: 100, category: category)
        expect(product).to_not be_valid
      end


      it 'should have a quantity' do
        category=Category.new(name:"drink")
       product=Product.new(name: "new", price: 100, quantity: nil, category: category)
        expect(product).to_not be_valid
      end


      it 'should have a category' do
        category=Category.new(name:"drink")
       product=Product.new(name: "new", price: 500, quantity: 100, category: nil)
        expect(product).to_not be_valid
      end

 
    end
  end


