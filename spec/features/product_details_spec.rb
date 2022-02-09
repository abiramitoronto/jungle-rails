require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true  do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 69.69
      )
    end
  end

  scenario "User clicks on product details" do
    # ACT
    visit root_path

    # VERIFY
    expect(page).to have_css('article.product', count: 10)
    # expect(page).to have_text('64.99')
    page.first("article.product").click_on("Details")

    # DEBUG
    save_screenshot('product_hover.png')

    # VERIFY
    expect(page).to have_css 'section.products-show'
    # expect(page).to have_text('Quantity')
  end

  scenario "User sees product details" do
    # ACT
    visit "products/1"

    # DEBUG
    save_screenshot('product_details.png')

    # VERIFY
    expect(page).to have_css 'section.products-show'
    # expect(page).to have_text('Quantity')
  end
end
