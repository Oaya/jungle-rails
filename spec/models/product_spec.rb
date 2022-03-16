require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validations' do
   it "all filed valid" do
    category = Category.create(name: "furniture")
    product = Product.create(name: "book shelf", price_cents: 123123, quantity: 100, category: category)

    expect(product).to be_valid   
    end

    it 'name is presence' do 
      category = Category.create(name: 'furniture')
      product = Product.create(name: nil, price_cents: 123123, quantity: 123, category: category)
  
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'price is presence' do 
      category = Category.create(name: 'furniture')
      product = Product.create(name: "book shelf", price_cents: nil, quantity: 123, category: category)
  
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'quantity is presence' do 
      category = Category.create(name: 'furniture')
      product = Product.create(name: "book shelf", price_cents: 123123, quantity: nil, category: category)
  
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'category is presence' do 
    
      product = Product.create(name: "book shelf", price_cents: 123123, quantity: 123, category: nil)
  
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

   end
end

