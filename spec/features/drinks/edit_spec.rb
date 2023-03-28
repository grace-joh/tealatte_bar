require 'rails_helper'

RSpec.describe 'the drink edit page' do
  before(:each) do
    @teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @black_mt = @teas.drinks.create!(name: 'Black Milk Tea', calories: 270, in_season: true)
  end

  it 'can see the update form' do
    visit "/drinks/#{@black_mt.id}/edit"

    expect(page).to have_field('Name', with: @black_mt.name)
    expect(page).to have_field('Calories', with: @black_mt.calories)
    expect(page).to have_content('In season')
    expect(page).to have_checked_field('True')
  end

  it 'can update an category' do
    visit "/drinks/#{@black_mt.id}/edit"

    fill_in('Name', with: 'Assam Milk Tea')
    choose 'True'

    click_on('Update')

    expect(current_path).to eq("/drinks/#{@black_mt.id}")
    expect(page).to have_content('Assam Milk Tea')
    expect(page).to have_content('Calories: 270')
    expect(page).to have_content('In season? true')
  end
end
