require 'rails_helper'

RSpec.describe 'the category drinks index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @black_mt = Drink.create!(name: 'Black Milk Tea', calories: 270, has_milk: true, category_id: @milk_teas.id)
    @mango_smth = Drink.create!(name: 'Mango Smoothie', calories: 300, has_milk: true, category_id: @smoothies.id)
  end

  it 'displays the category name and all drinks in the category with their attributes' do
    visit "/categories/#{@milk_teas.id}/drinks"

    expect(page).to have_content(@milk_teas.name)
    expect(page).to_not have_content(@smoothies.name)

    expect(page).to have_content(@black_mt.name)
    expect(page).to_not have_content(@mango_smth.name)
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.has_milk)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)
  end
end
