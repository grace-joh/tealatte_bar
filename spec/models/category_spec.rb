require 'rails_helper'

RSpec.describe Category do
  before :each do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @lemonade = Category.create!(name: 'Lemonade', price: 5, caffeinated: false)
    @black_mt = Drink.create!(name: 'Black Milk Tea', calories: 270, has_milk: true, category_id: @milk_teas.id)
    @oolong_mt = Drink.create!(name: 'Oolong Milk Tea', calories: 230, has_milk: true, category_id: @milk_teas.id)
    @mango_smth = Drink.create!(name: 'Mango Smoothie', calories: 300, has_milk: true, category_id: @smoothies.id)
  end

  describe 'relationships' do
    it { should have_many :drinks }
  end

  describe 'instance methods' do
    describe '#drinks' do
      it 'returns all of the drink objects in the category' do
        expect(@milk_teas.drinks).to eq([@black_mt, @oolong_mt])
        expect(@milk_teas.drinks.count).to eq(2)
      end
    end
  end

  describe 'class methods' do
    describe '::sort_by_newest' do
      it 'lists categories by most recent created_at timestamp' do
        expect(Category.sort_by_newest).to eq([@lemonade, @smoothies, @milk_teas])
      end
    end
  end
end
