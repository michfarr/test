require 'rails_helper'

describe Product do
  describe "validations" do

    it "requires a name" do
      product = Product.new( name: "" )
      product.valid?
      expect( product.errors ).to have_key( :name )
    end

    it "requires a description" do
      product = Product.new( description: "" )
      product.valid?
      expect( product.errors ).to have_key( :description )

    end
    it "does not require a price" do
      product = Product.new( price: nil )
      product.valid?
      expect( product.errors ).to_not have_key( :price )
    end
  end

  describe Product do
    context "is a bargain" do

      it "is true if the product price is less than 10" do
        product = Product.new( price: 8 )
        expect(product.bargain?).to eq(true)
      end

    end
    context "is not a bargain" do

      it "is false if the product price is 10 or more" do
        product = Product.new( price: 10 )
        expect(product.bargain?).to eq(false)
      end

    end
  end
end
