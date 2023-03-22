require 'rails_helper'

RSpec.describe 'the categories index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
  end

  it 'displays the names of all categories and created at timestamp' do
    visit '/categories'

    expect(page).to have_content(@milk_teas.name)
    expect(page).to have_content("Created at #{@milk_teas.created_at}")
    expect(page).to have_content(@smoothies.name)
    expect(page).to have_content("Created at #{@smoothies.created_at}")
  end

  it 'displays the category names sorted by newest category' do
    visit '/categories'

    expect(@smoothies.name).to appear_before(@milk_teas.name)
  end
end
