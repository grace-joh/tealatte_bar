require 'rails_helper'

RSpec.describe 'the category new page' do
  it 'links to the new page from the category index' do
    visit '/categories'

    click_link('New Category')
    expect(current_path).to eq('/categories/new')
  end

  it 'can create a new category' do
    visit '/categories/new'

    fill_in('Name', with: 'Fruit Teas')
    fill_in('Price', with: 5)
    choose 'caffeinated_true'
    click_button('Create Category')

    expect(current_path).to eq('/categories')
    expect(page).to have_content('Fruit Teas')
  end
end
