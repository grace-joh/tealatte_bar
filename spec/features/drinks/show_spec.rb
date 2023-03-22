require 'rails_helper'

RSpec.describe 'a drink show page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @black_mt = @milk_teas.drinks.create!(name: 'Black Milk Tea', calories: 270, has_milk: true)
    @mango_smth = @smoothies.drinks.create!(name: 'Mango Smoothie', calories: 300, has_milk: true)
  end

  it 'displays the drink attributes' do
    visit "/drinks/#{@black_mt.id}"

    expect(page).to have_content(@black_mt.name)
    expect(page).to_not have_content(@mango_smth.name)
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.has_milk)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)
  end
end
