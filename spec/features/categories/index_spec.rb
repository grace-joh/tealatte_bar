require 'rails_helper'

RSpec.describe 'the categories index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @lemonade = Category.create!(name: 'Lemonade', price: 5, caffeinated: false)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @black_mt = @milk_teas.drinks.create!(name: 'Black Milk Tea', calories: 270, has_milk: true)
    @assam_mt = @milk_teas.drinks.create!(name: 'Assam Milk Tea', calories: 250, has_milk: true)
    @oolong_mt = @milk_teas.drinks.create!(name: 'Oolong Milk Tea', calories: 220, has_milk: true)
    @mango_smth = @smoothies.drinks.create!(name: 'Mango Smoothie', calories: 300, has_milk: true)

    visit '/categories'
  end

  it 'displays the page title' do
    expect(page).to have_content('Menu')
  end

  it 'displays the sort buttons' do
    expect(page).to have_content('Sort by:')
    expect(page).to have_button('Newest')
    expect(page).to have_button('Number of Drinks')
  end

  it 'displays the names of all categories with edit/delete link and created at timestamp' do
    expect(page).to have_content(@milk_teas.name)
    expect(page).to have_link('Edit', href: "/categories/#{@milk_teas.id}/edit")
    expect(page).to have_link('Delete', href: "/categories/#{@milk_teas.id}")
    expect(page).to have_content("Created at #{@milk_teas.created_at}")
    expect(page).to have_content(@lemonade.name)
    expect(page).to have_link('Edit', href: "/categories/#{@lemonade.id}/edit")
    expect(page).to have_link('Delete', href: "/categories/#{@lemonade.id}")
    expect(page).to have_content("Created at #{@lemonade.created_at}")
    expect(page).to have_content(@smoothies.name)
    expect(page).to have_link('Edit', href: "/categories/#{@smoothies.id}/edit")
    expect(page).to have_link('Delete', href: "/categories/#{@smoothies.id}")
    expect(page).to have_content("Created at #{@smoothies.created_at}")
  end

  it 'can display the category names in a default order' do
    expect(@milk_teas.name).to appear_before(@lemonade.name)
    expect(@lemonade.name).to appear_before(@smoothies.name)
  end

  it 'can display the category names sorted by newest category' do
    click_link('Newest')

    expect(current_path).to eq('/categories')
    expect(@smoothies.name).to appear_before(@lemonade.name)
    expect(@lemonade.name).to appear_before(@milk_teas.name)
  end

  it 'can display the category names sorted by number of drinks' do
    click_link('Number of Drinks')

    expect(current_path).to eq('/categories')
    expect(@milk_teas.name).to appear_before(@smoothies.name)
    expect(@smoothies.name).to appear_before(@lemonade.name)
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
