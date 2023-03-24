require 'rails_helper'

RSpec.describe 'the categories index page', type: :feature do
  before(:each) do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
  
    visit '/categories'
  end

  it 'displays the page title' do
    expect(page).to have_content('Menu')
  end

  it 'displays the names of all categories with edit link and created at timestamp' do
    expect(page).to have_content(@milk_teas.name)
    expect(page).to have_link('Edit', href: "/categories/#{@milk_teas.id}/edit")
    expect(page).to have_content("Created at #{@milk_teas.created_at}")
    expect(page).to have_content(@smoothies.name)
    expect(page).to have_link('Edit', href: "/categories/#{@smoothies.id}/edit")
    expect(page).to have_content("Created at #{@smoothies.created_at}")
  end

  it 'displays the category names sorted by newest category' do
    expect(@smoothies.name).to appear_before(@milk_teas.name)
  end

  it 'links to the new page from the category index' do
    click_link('Add a category')

    expect(current_path).to eq('/categories/new')
  end
end
