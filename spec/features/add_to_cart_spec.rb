require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do



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

    
    puts page.html 

    click_on 'Add'
    click_on 'My Cart'

    expect(page).to have_text 'TOTAL'
    save_screenshot

  end







end
