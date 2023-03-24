require 'rails_helper'

RSpec.describe 'the category edit page' do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
  end

  it 'links to the edit page from the category show page' do
    visit "/categories/#{@milk_teas.id}"

    click_link('Edit')
    expect(current_path).to eq("/categories/#{@milk_teas.id}/edit")
  end

  it 'can see the update form' do
    visit "/categories/#{@milk_teas.id}/edit"

    expect(page).to have_field('Name', with: @milk_teas.name)
    expect(page).to have_field('Price', with: @milk_teas.price)
    expect(page).to have_content('Caffeinated')
    expect(page).to have_checked_field('True')
  end

  it 'can update an category' do
    visit "/categories/#{@milk_teas.id}/edit"

    fill_in('Name', with: 'Fruit Teas')
    fill_in('Price', with: 7)
    choose 'False'

    click_on('Update')

    expect(current_path).to eq("/categories/#{@milk_teas.id}")
    expect(page).to have_content('Fruit Teas')
    expect(page).to have_content('Price: $7')
    expect(page).to have_content('Have caffeine? false')
    # expect(@milk_teas.name).to eq('Fruit Teas')
  end
end
