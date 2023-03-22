require 'rails_helper'

RSpec.describe 'the categories index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
  end

  it 'displays the names of all categories' do
    visit '/categories'

    expect(page).to have_content(@milk_teas.name)
    expect(page).to have_content(@smoothies.name)
  end
end
