require 'rails_helper'

RSpec.describe 'the category drinks index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @black_mt = Drink.create!(name: 'Black Milk Tea', calories: 270, has_milk: true, category_id: @milk_teas.id)
    @assam_mt = Drink.create!(name: 'Assam Milk Tea', calories: 250, has_milk: true, category_id: @milk_teas.id)
    @oolong_mt = Drink.create!(name: 'Oolong Milk Tea', calories: 220, has_milk: true, category_id: @milk_teas.id)
    @mango_smth = Drink.create!(name: 'Mango Smoothie', calories: 300, has_milk: true, category_id: @smoothies.id)
    @drinks = @milk_teas.drinks

    visit "/categories/#{@milk_teas.id}/drinks"
  end

  it 'displays the page title' do
    expect(page).to have_content(@milk_teas.name)
    expect(page).to_not have_content(@smoothies.name)
  end

  it 'displays sort options' do
    expect(page).to have_content('Sort by:')
    expect(page).to have_button('Name')
    expect(page).to have_button('Calories')
  end

  it 'displays the names of all drinks in the category with their attributes' do
    expect(page).to have_content(@black_mt.name)
    expect(page).to_not have_content(@mango_smth.name)
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.has_milk)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)
  end

  it 'displays drinks in default order by id' do
    expect(@black_mt.name).to appear_before(@assam_mt.name)
    expect(@assam_mt.name).to appear_before(@oolong_mt.name)
  end

  it 'displays drinks sorted by name' do
    click_link('Name')

    expect(@assam_mt.name).to appear_before(@black_mt.name)
    expect(@black_mt.name).to appear_before(@oolong_mt.name)
  end

  it 'displays drinks sorted by calories' do
    click_link('Calories')

    expect(@oolong_mt.name).to appear_before(@assam_mt.name)
    expect(@assam_mt.name).to appear_before(@black_mt.name)
  end
end
