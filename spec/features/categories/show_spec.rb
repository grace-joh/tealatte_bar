require 'rails_helper'

RSpec.describe 'the categories show page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @slushes = Category.create!(name: 'Slushes', price: 5, caffeinated: false)
    @black_mt = Drink.create!(name: 'Black Milk Tea', calories: 270, has_milk: true, category_id: @milk_teas.id)
    @mango_slush = Drink.create!(name: 'Mango Slush', calories: 260, has_milk: false, category_id: @slushes.id)
    @drinks = Drink.all

    visit "/categories/#{@milk_teas.id}"
  end

  it 'displays the category name and attributes' do
    expect(page).to have_content(@milk_teas.name)
    expect(page).to_not have_content(@slushes.name)
    expect(page).to have_content("Price: $#{@milk_teas.price}")
    expect(page).to have_content("Have caffeine? #{@milk_teas.caffeinated}")
    expect(page).to have_content("Created at #{@milk_teas.created_at}")
    expect(page).to have_content("Updated at #{@milk_teas.updated_at}")
  end

  it 'has a link to the category drinks index page' do
    click_link("See all #{@milk_teas.name}")

    expect(current_path).to eq("/categories/#{@milk_teas.id}/drinks")
  end

  it 'has a link to the category edit page' do
    click_link('Edit')

    expect(current_path).to eq("/categories/#{@milk_teas.id}/edit")
  end

  it 'can delete a category and its children and redirects to categories index' do
    click_link('Delete')

    expect(current_path).to eq('/categories')
    expect(page).to_not have_content(@milk_teas.name)

    visit('/drinks')

    expect(page).to_not have_content(@milk_teas.name)
  end
end
