require 'rails_helper'

RSpec.describe 'the category drinks index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @black_mt = @milk_teas.drinks.create!(name: 'Black Milk Tea', calories: 270, has_milk: true)
    @assam_mt = @milk_teas.drinks.create!(name: 'Assam Milk Tea', calories: 250, has_milk: true)
    @oolong_mt = @milk_teas.drinks.create!(name: 'Oolong Milk Tea', calories: 220, has_milk: true)
    @mango_smth = @smoothies.drinks.create!(name: 'Mango Smoothie', calories: 300, has_milk: true)
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

  it 'displays search form for max calories' do
    expect(page).to have_content('Max calories:')
    expect(page).to have_field('cal_max')
    expect(page).to have_button('Apply')
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

  it 'filters drinks by max calories' do
    fill_in('cal_max', with: 250)
    click_on('Apply')

    expect(page).to_not have_content(@black_mt.name)
  end
end
