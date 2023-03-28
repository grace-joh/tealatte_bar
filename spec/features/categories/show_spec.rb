require 'rails_helper'

RSpec.describe 'the categories show page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @slushes = Category.create!(name: 'Slushes', price: 5, caffeinated: false)
    @black_mt = @milk_teas.drinks.create!(name: 'Black Milk Tea', calories: 270, in_season: true)
    @mango_slush = @slushes.drinks.create!(name: 'Mango Slush', calories: 260, in_season: false)

    visit "/categories/#{@milk_teas.id}"
  end

  it 'displays the navigation links' do
    expect(page).to have_link('Categories', href: '/categories')
    expect(page).to have_link('Drinks', href: '/drinks')
  end

  it 'displays the category name and attributes' do
    expect(page).to have_content(@milk_teas.name)
    expect(page).to_not have_content(@slushes.name)
    expect(page).to have_content("Price: $#{@milk_teas.price}")
    expect(page).to have_content("Have caffeine? #{@milk_teas.caffeinated}")
    expect(page).to have_content("Created at #{@milk_teas.created_at}")
    expect(page).to have_content("Updated at #{@milk_teas.updated_at}")
    expect(page).to have_content("Number of drinks: #{@milk_teas.drinks.size}")
  end

  it 'has a button to the category drinks index page' do
    click_button("See all #{@milk_teas.name}")

    expect(current_path).to eq("/categories/#{@milk_teas.id}/drinks")
  end

  it 'has a button to the category edit page' do
    click_button('Edit')

    expect(current_path).to eq("/categories/#{@milk_teas.id}/edit")
  end

  it 'can delete a category and its children and redirects to categories index' do
    click_button('Delete')

    expect(current_path).to eq('/categories')
    expect(page).to_not have_content(@milk_teas.name)

    visit('/drinks')

    expect(page).to_not have_content(@milk_teas.name)
  end
end
