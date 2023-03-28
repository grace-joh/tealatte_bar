require 'rails_helper'

RSpec.describe 'the category edit page' do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)

    visit "/categories/#{@milk_teas.id}/edit"
  end

  it 'displays the header and navigation links' do
    expect(page).to have_content('TeaLatte Bar')
    expect(page).to have_link('Categories', href: '/categories')
    expect(page).to have_link('Drinks', href: '/drinks')
  end

  it 'displays the page title' do
    expect(page).to have_content('Edit')
  end

  it 'can see the update form' do
    expect(page).to have_field('Name', with: @milk_teas.name)
    expect(page).to have_field('Price', with: @milk_teas.price)
    expect(page).to have_content('Caffeinated')
    expect(page).to have_checked_field('True')
  end

  it 'can update an category' do
    fill_in('Name', with: 'Fruit Teas')
    fill_in('Price', with: 7)
    choose 'False'

    click_on('Update')

    expect(current_path).to eq("/categories/#{@milk_teas.id}")
    expect(page).to have_content('Fruit Teas')
    expect(page).to have_content('Price: $7')
    expect(page).to have_content('Have caffeine? false')
  end
end
