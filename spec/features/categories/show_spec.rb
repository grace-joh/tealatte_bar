require 'rails_helper'

RSpec.describe 'the categories show page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
  end

  it 'displays the category name and attributes' do
    visit "/categories/#{@milk_teas.id}"

    expect(page).to have_content(@milk_teas.name)
    expect(page).to_not have_content(@smoothies.name)
    expect(page).to have_content("Price: #{@milk_teas.price}")
    expect(page).to have_content("Have caffeine? #{@milk_teas.caffeinated}")
    expect(page).to have_content("Created at #{@milk_teas.created_at}")
    expect(page).to have_content("Updated at #{@milk_teas.updated_at}")
  end
end
