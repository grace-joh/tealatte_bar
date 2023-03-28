require 'rails_helper'

RSpec.describe 'the drinks index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @slushes = Category.create!(name: 'Slushes', price: 5, caffeinated: false)
    @black_mt = Drink.create!(name: 'Black Milk Tea', calories: 270, has_milk: true, category_id: @milk_teas.id)
    @mango_slush = Drink.create!(name: 'Mango Slush', calories: 260, has_milk: false, category_id: @slushes.id)
    @drinks = Drink.all

    visit '/drinks'
  end

  it 'displays the page title' do
    expect(page).to have_content('Drinks')
  end

  it 'displays filter options' do
    expect(page).to have_content('Filter by:')
    expect(page).to have_button('All Drinks')
    expect(page).to have_button('With Milk')
    expect(page).to have_button('No Milk')
  end

  it 'displays the names of all drinks with edit button and their attributes' do
    expect(page).to have_content(@black_mt.name)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.has_milk)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)

    expect(page).to have_content(@mango_slush.name)
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
    expect(page).to have_content(@mango_slush.calories)
    expect(page).to have_content(@mango_slush.has_milk)
    expect(page).to have_content(@mango_slush.created_at)
    expect(page).to have_content(@mango_slush.updated_at)
  end

  it 'links to the edit page from the category show page' do
    first('.edit').click

    expect(current_path).to eq("/drinks/#{@black_mt.id}/edit")
  end

  it 'can delete a drink' do
    first('.delete').click

    expect(current_path).to eq('/drinks')
    expect(page).to_not have_content(@black_mt.name)
  end

  it 'displays only filtered milk drinks' do
    click_link('With Milk')

    expect(page).to have_content(@black_mt.name)
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.has_milk)

    expect(page).to_not have_content(@mango_slush.name)
    expect(page).to_not have_content(@mango_slush.calories)
    expect(page).to_not have_content(@mango_slush.has_milk)
  end

  it 'displays only filtered non-milk drinks' do
    click_link('No Milk')

    expect(page).to have_content(@mango_slush.name)
    expect(page).to have_content(@mango_slush.calories)
    expect(page).to have_content(@mango_slush.has_milk)

    expect(page).to_not have_content(@black_mt.name)
    expect(page).to_not have_content(@black_mt.calories)
    expect(page).to_not have_content(@black_mt.has_milk)
  end

  it 'displays all drinks on click of button after filtering' do
    click_link('No Milk')

    expect(page).to_not have_content(@black_mt.name)

    click_link('All Drinks')

    expect(page).to have_content(@black_mt.name)
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.has_milk)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)

    expect(page).to have_content(@mango_slush.name)
    expect(page).to have_content(@mango_slush.calories)
    expect(page).to have_content(@mango_slush.has_milk)
    expect(page).to have_content(@mango_slush.created_at)
    expect(page).to have_content(@mango_slush.updated_at)
  end
end
