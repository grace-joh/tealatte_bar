require 'rails_helper'

RSpec.describe 'a drink show page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @black_mt = Drink.create!(name: 'Black Milk Tea', calories: 270, has_milk: true, category_id: @milk_teas.id)
    @mango_smth = Drink.create!(name: 'Mango Smoothie', calories: 300, has_milk: true, category_id: @smoothies.id)
  end

  it 'displays the drink attributes' do
    visit "/drinks/#{@milk_teas.id}"

    expect(page).to have_content(@black_mt.name)
    expect(page).to have_content(@black_mt.calories)
    expect(page).to have_content(@black_mt.has_milk)
    expect(page).to have_content(@black_mt.created_at)
    expect(page).to have_content(@black_mt.updated_at)

    expect(page).to_not have_content(@mango_smth.name)
    expect(page).to_not have_content(@mango_smth.calories)
    expect(page).to_not have_content(@mango_smth.has_milk)
    expect(page).to_not have_content(@mango_smth.created_at)
    expect(page).to_not have_content(@mango_smth.updated_at)
  end
end
