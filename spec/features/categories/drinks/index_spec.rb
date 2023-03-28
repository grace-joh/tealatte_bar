require 'rails_helper'

RSpec.describe 'the category drinks index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @black_mt = @milk_teas.drinks.create!(name: 'Black Milk Tea', calories: 270, in_season: true)
    @assam_mt = @milk_teas.drinks.create!(name: 'Assam Milk Tea', calories: 250, in_season: true)
    @oolong_mt = @milk_teas.drinks.create!(name: 'Oolong Milk Tea', calories: 220, in_season: true)
    @mango_smth = @smoothies.drinks.create!(name: 'Mango Smoothie', calories: 300, in_season: true)

    visit "/categories/#{@milk_teas.id}/drinks"
  end

  it 'displays the header and navigation links' do
    expect(page).to have_content('TeaLatte Bar')
    expect(page).to have_link('Categories', href: '/categories')
    expect(page).to have_link('Drinks', href: '/drinks')
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
    expect(page).to have_content(@black_mt.in_season)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)

    expect(page).to have_content(@assam_mt.name)
    expect(page).to have_content(@assam_mt.calories)
    expect(page).to have_content(@assam_mt.in_season)
    expect(page).to have_content(@assam_mt.created_at)
    expect(page).to have_content(@assam_mt.updated_at)

    expect(page).to have_content(@oolong_mt.name)
    expect(page).to have_content(@oolong_mt.calories)
    expect(page).to have_content(@oolong_mt.in_season)
    expect(page).to have_content(@oolong_mt.created_at)
    expect(page).to have_content(@oolong_mt.updated_at)
  end

  it 'displays drinks in default order by id' do
    expect(@black_mt.name).to appear_before(@assam_mt.name)
    expect(@assam_mt.name).to appear_before(@oolong_mt.name)
  end

  it 'displays drinks sorted by name' do
    click_button('Name')

    expect(@assam_mt.name).to appear_before(@black_mt.name)
    expect(@black_mt.name).to appear_before(@oolong_mt.name)
  end

  it 'displays drinks sorted by calories' do
    click_button('Calories')

    expect(@oolong_mt.name).to appear_before(@assam_mt.name)
    expect(@assam_mt.name).to appear_before(@black_mt.name)
  end

  it 'filters drinks by max calories' do
    fill_in('cal_max', with: 250)
    click_on('Apply')

    expect(page).to_not have_content(@black_mt.name)
  end

  it 'links to the category drinks new page' do
    click_button('Add a drink')

    expect(current_path).to eq("/categories/#{@milk_teas.id}/drinks/new")
  end
end
