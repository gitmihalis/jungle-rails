require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 8,
        price_cents: 64.99
      )
    end
  end

  scenario "add line_item to cart", js: true do
    visit root_path
    page.first(".product").find_link('Add').click
    puts page.html
    expect(page).to have_text(' My Cart (1)', count: 1)
    save_screenshot('my_cart_added.png')
  end
end
