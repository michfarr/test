require 'rails_helper'

describe "Navigating products" do
  it "allows navigation from
      the detail page to the listing page" do
    product = Product.create(
              name: "Thingy-ma-bob",
              description: "Delicious"
              )
    visit product_url(product)
    click_link "Back"

    expect(current_path).to eq(products_path)
  end

  it "allows navigation from
      the detail page to the edit page" do
    product = Product.create(
              name: "Thingy-ma-bob",
              description: "Delicious"
              )
    visit product_url(product)
    click_link "Edit"

    expect(current_path).to eq(edit_product_path)
  end

  it "allows navigation from
      the index page to show product page" do
    visit product_url(products)
    click_link "Show"

    expect(current_path).to eq(product_path)
  end

  it "allows navigation from
      the index page to edit_product page" do
    visit product_url(products)
    click_link "Edit"

    expect(current_path).to eq(edit_product_path)
  end

  it "allows navigation from
      the index page to new_product page" do
    visit product_url(products)
    click_link "New"

    expect(current_path).to eq(new_product_path)
  end
end
