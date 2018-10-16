require 'rails_helper'

RSpec.feature "User can add a product to their cart", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Add a product to their cart" do
    # ACT
    visit root_path
    first('form.button_to').click

    page.has_content?('My Cart (1)')

    # DEBUG / VERIFY
    save_screenshot
  end
end
