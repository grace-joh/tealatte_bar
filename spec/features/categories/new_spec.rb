require 'rails_helper'

RSpec.describe 'the category new page' do
  before(:each) do
    visit '/categories/new'
  end

  it 'displays the header and navigation links' do
    expect(page).to have_content('TeaLatte Bar')
    expect(page).to have_link('Categories', href: '/categories')
    expect(page).to have_link('Drinks', href: '/drinks')
  end

  it 'displays the page title' do
    expect(page).to have_content('Create')
  end

  it 'displays the creation form' do
    expect(page).to have_field('Name')
    expect(page).to have_field('Price')
    expect(page).to have_content('Caffeinated')
    expect(page).to have_unchecked_field('True')
    expect(page).to have_unchecked_field('False')
    expect(page).to have_button('Add Category')
  end

  it 'can create a new category' do
    fill_in('Name', with: 'Fruit Teas')
    fill_in('Price', with: 5)
    choose 'caffeinated_true'
    click_button('Add Category')

    expect(current_path).to eq('/categories')
    expect(page).to have_content('Fruit Teas')
  end
end
