require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"


  RSpec.describe Product, type: :model do
    describe 'Validations' do
      it 'should create a product with all 4 fields' do
        @category = Category.new(name: 'test')
        @Product = Product.new(name:'test', price: 10, quantity: 2, category: @category)
        expect(@Product).to be_valid
      end 

      it 'should have its name' do
        @Product = Product.new
        # @Product.name = "books"
        @Product.name = nil
        @Product.valid?
        expect(@Product.errors[:name]).to include("can't be blank")
        # expect(@Product.errors[:name]).not_to include("can't be blank")
      end

      it 'should have its price tag' do
        @Product = Product.new
        @Product.price = nil
        @Product.valid?
        expect(@Product.errors[:price]).not_to include("can't be blank")
      end

      it 'should have its quantity' do
        @Product = Product.new
        @Product.quantity = nil
        @Product.valid?
        expect(@Product.errors[:quantity]).to include("can't be blank")
      end

      it 'should have its category' do
        @Product = Product.new
        @Product.category = nil
        @Product.valid?
        expect(@Product.errors[:category]).to include("can't be blank")
      end
        
      # validation tests/examples here
    end
  end
# end




# describe '#id' do
#   it 'should not exist for new records' do
#     @widget = Widget.new
#     expect(@widget.id).to be_nil
#   end

#   it 'should be auto-assigned by AR for saved records' do
#     @widget = Widget.new
#     # we use bang here b/c we want our spec to fail if save fails (due to validations)
#     # we are not testing for successful save so we have to assume it will be successful
#     @widget.save!

#     expect(@widget.id).to be_present
#   end
# end