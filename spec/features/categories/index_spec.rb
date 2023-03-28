require 'rails_helper'

RSpec.describe 'the categories index page', type: :feature do
  before(:each) do
    @lemonades = Category.create!(name: 'Lemonade', price: 5, caffeinated: false)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @black_mt = @milk_teas.drinks.create!(name: 'Black Milk Tea', calories: 270, in_season: true)
    @strawberry_smth = @smoothies.drinks.create!(name: 'Strawberry Smoothie', calories: 320, in_season: true)
    @mango_smth = @smoothies.drinks.create!(name: 'Mango Smoothie', calories: 300, in_season: true)
    @watermelon_smth = @smoothies.drinks.create!(name: 'Watermelon Smoothie', calories: 260, in_season: true)

    visit '/categories'
  end

  it 'displays the navigation links' do
    expect(page).to have_link('Categories', href: '/categories')
    expect(page).to have_link('Drinks', href: '/drinks')
  end

  it 'displays the page title' do
    expect(page).to have_content('Menu')
  end

  it 'displays the sort buttons' do
    expect(page).to have_content('Sort by:')
    expect(page).to have_button('Number of Drinks')
  end

  it 'displays the names of all categories with edit/delete link and created at timestamp' do
    expect(page).to have_content(@milk_teas.name)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
    expect(page).to have_content("Number of drinks: #{@milk_teas.drinks.size}")
    expect(page).to have_content("Created at #{@milk_teas.created_at}")
    expect(page).to have_content(@smoothies.name)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
    expect(page).to have_content("Number of drinks: #{@smoothies.drinks.size}")
    expect(page).to have_content("Created at #{@smoothies.created_at}")
    expect(page).to have_content(@lemonades.name)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
    expect(page).to have_content("Number of drinks: #{@lemonades.drinks.size}")
    expect(page).to have_content("Created at #{@lemonades.created_at}")
  end

  it 'displays the category names sorted by newest category by default' do
    expect(@milk_teas.name).to appear_before(@smoothies.name)
    expect(@smoothies.name).to appear_before(@lemonades.name)
  end

  it 'can display the category names sorted by number of drinks' do
    click_button('Number of Drinks')

    expect(current_path).to eq('/categories')
    expect(@smoothies.name).to appear_before(@milk_teas.name)
    expect(@milk_teas.name).to appear_before(@lemonades.name)
  end

  it 'links to a drinks edit page' do
    first('.edit').click

    expect(current_path).to eq("/categories/#{@milk_teas.id}/edit")
  end

  it 'can delete a category' do
    first('.delete').click

    expect(current_path).to eq('/categories')
    expect(page).to_not have_content(@milk_teas.name)
  end

  it 'links to the new page from the category index' do
    click_button('Add a category')

    expect(current_path).to eq('/categories/new')
  end
end
