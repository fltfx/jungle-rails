require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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

  scenario "They can navigate from the home page to the product detail page by clicking on a product" do
    visit root_path
    # find('article.product', match: :first).click
    find('p.description', match: :first).click
    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    # DEBUG
    save_screenshot
    puts page.html
    #expect(page).to have_css 'section.products-show'
    within('main') do
      expect(page).to have_css("section.products-show")
    end
  end
end