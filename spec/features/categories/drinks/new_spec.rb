require 'rails_helper'

RSpec.describe 'the category drink new page' do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @green_mt = @milk_teas.drinks.create!(name: 'Green Milk Tea', calories: 260, has_milk: true)
  end

  it 'links to the new page from the category drinks index' do
    visit "/categories/#{@milk_teas.id}/drinks"

    click_link('Add a drink')
    expect(current_path).to eq("/categories/#{@milk_teas.id}/drinks/new")
  end

  it 'can create a new drink in that category' do
    visit "/categories/#{@milk_teas.id}/drinks/new"

    fill_in('Name', with: @green_mt.name)
    fill_in('Calories', with: @green_mt.calories)
    choose 'has_milk_true'
    click_button('Add Drink')

    expect(current_path).to eq("/categories/#{@milk_teas.id}/drinks")
    expect(page).to have_content(@green_mt.name)
    expect(page).to have_content("Calories: #{@green_mt.calories}")
    expect(page).to have_content("Has milk? #{@green_mt.has_milk}")
  end
end
