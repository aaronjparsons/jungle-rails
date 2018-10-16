require 'rails_helper'

RSpec.feature "Users can navigate to product page by clicking on a product", type: :feature, js: true do
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

  scenario "Navigate to the product page" do
    # ACT
    visit root_path
    first('article.product a.pull-right').click

    expect(page).to have_css 'article.product-detail'

    # DEBUG / VERIFY
    save_screenshot
  end

end
