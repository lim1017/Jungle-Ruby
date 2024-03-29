require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do


  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Vist home page, and click on product to view details" do
    # ACT
    visit root_path
    save_screenshot

    click_link 'Details'

    expect(page).to have_text 'Price'
    #expect waits for page to load.

    # DEBUG / VERIFY
    save_screenshot

  end




end
