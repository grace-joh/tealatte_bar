require 'rails_helper'

RSpec.describe 'a drink show page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @black_mt = @milk_teas.drinks.create!(name: 'Black Milk Tea', calories: 270, in_season: true)
    @mango_smth = @smoothies.drinks.create!(name: 'Mango Smoothie', calories: 300, in_season: true)

    visit "/drinks/#{@black_mt.id}"
  end

  it 'displays the drink attributes' do
    expect(page).to have_content(@black_mt.name)
    expect(page).to_not have_content(@mango_smth.name)
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.in_season)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)
  end

  it 'has a link to the category edit page' do
    click_button('Edit')

    expect(current_path).to eq("/drinks/#{@black_mt.id}/edit")
  end

  it 'can delete a drink and redirects to drinks index' do
    click_button('Delete')

    expect(current_path).to eq('/drinks')
    expect(page).to_not have_content(@black_mt.name)
  end
end
