require 'rails_helper'

RSpec.describe 'the category drink new page' do
  before(:each) do
    @teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @green_mt = @teas.drinks.create!(name: 'Green Milk Tea', calories: 260, in_season: true)

    visit "/categories/#{@teas.id}/drinks/new"
  end

  it 'displays the navigation links' do
    expect(page).to have_link('Categories', href: '/categories')
    expect(page).to have_link('Drinks', href: '/drinks')
  end

  it 'can see the creation form' do
    expect(page).to have_field('Name')
    expect(page).to have_field('Calories')
    expect(page).to have_content('In season')
    expect(page).to have_unchecked_field('True')
    expect(page).to have_unchecked_field('False')
    expect(page).to have_button('Add Drink')
  end

  it 'can create a new drink in that category' do
    fill_in('Name', with: @green_mt.name)
    fill_in('Calories', with: @green_mt.calories)
    choose 'in_season_true'
    click_button('Add Drink')

    expect(current_path).to eq("/categories/#{@teas.id}/drinks")
    expect(page).to have_content(@green_mt.name)
    expect(page).to have_content("Calories: #{@green_mt.calories}")
    expect(page).to have_content("In season? #{@green_mt.in_season}")
  end
end
