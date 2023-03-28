require 'rails_helper'

RSpec.describe 'the drinks index page', type: :feature do
  before(:each) do
    @teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @slushes = Category.create!(name: 'Slushes', price: 5, caffeinated: false)
    @black_mt = @teas.drinks.create!(name: 'Black Milk Tea', calories: 270, in_season: true)
    @mango_slush = @slushes.drinks.create!(name: 'Mango Slush', calories: 250, in_season: true)
    @passion_fruit_slush = @slushes.drinks.create!(name: 'Passion Fruit Slush', calories: 240, in_season: false)

    visit '/drinks'
  end

  it 'displays the header and navigation links' do
    expect(page).to have_content('TeaLatte Bar')
    expect(page).to have_link('Categories', href: '/categories')
    expect(page).to have_link('Drinks', href: '/drinks')
  end

  it 'displays the page title' do
    expect(page).to have_content('Drinks')
  end
  
  it 'displays the names of all drinks with edit and delete buttons and their attributes' do
    expect(page).to have_content(@black_mt.name)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
    expect(page).to have_content(@black_mt.category.name)
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.in_season)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)

    expect(page).to have_content(@mango_slush.name)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
    expect(page).to have_content(@mango_slush.category.name)
    expect(page).to have_content(@mango_slush.calories)
    expect(page).to have_content(@mango_slush.in_season)
    expect(page).to have_content(@mango_slush.created_at)
    expect(page).to have_content(@mango_slush.updated_at)
  end

  it 'displays only in_season drinks' do
    expect(page).to_not have_content(@passion_fruit_slush.name)
    expect(page).to_not have_content(@passion_fruit_slush.calories)
    expect(page).to_not have_content(@passion_fruit_slush.in_season)
  end

  it 'links to the drink edit page' do
    first('.edit').click

    expect(current_path).to eq("/drinks/#{@black_mt.id}/edit")
  end

  it 'can delete a drink' do
    first('.delete').click

    expect(current_path).to eq('/drinks')
    expect(page).to_not have_content(@black_mt.name)
  end
end
