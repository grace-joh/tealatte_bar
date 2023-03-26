require 'rails_helper'

RSpec.describe Category do
  before :each do
    @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
    @lemonade = Category.create!(name: 'Lemonade', price: 5, caffeinated: false)
    @black_mt = Drink.create!(name: 'Black Milk Tea', calories: 270, has_milk: true, category_id: @milk_teas.id)
    @oolong_mt = Drink.create!(name: 'Oolong Milk Tea', calories: 230, has_milk: true, category_id: @milk_teas.id)
    @green_mt = Drink.create!(name: 'Green Milk Tea', calories: 220, has_milk: true, category_id: @milk_teas.id)
    @hongkong_mt = Drink.create!(name: 'Hong Kong Milk Tea', calories: 300, has_milk: true, category_id: @milk_teas.id)
    @mango_smth = Drink.create!(name: 'Mango Smoothie', calories: 300, has_milk: true, category_id: @smoothies.id)
  end

  describe 'relationships' do
    it { should have_many :drinks }
  end

  describe 'instance methods' do
    describe '#drinks' do
      it 'returns all of the drink objects in the category' do
        expect(@milk_teas.drinks).to eq([@black_mt, @oolong_mt, @green_mt, @hongkong_mt])
        expect(@milk_teas.drinks.count).to eq(4)
      end
    end

    describe '#sorted_and_filtered_drinks' do
      it 'returns drinks under max calories sorted alphabetically' do
        expect(@milk_teas.sorted_and_filtered_drinks(280, 'abc')).to eq([@black_mt, @green_mt, @oolong_mt])
      end

      it 'returns drinks under max calories sorted by calories ascending' do
        expect(@milk_teas.sorted_and_filtered_drinks(280, 'cal')).to eq([@green_mt, @oolong_mt, @black_mt])
      end

      it 'returns drinks under max calories not sorted' do
        expect(@milk_teas.sorted_and_filtered_drinks(280, false)).to eq([@black_mt, @oolong_mt, @green_mt])
      end

      it 'returns all drinks sorted by name alphabetically' do
        expect(@milk_teas.sorted_and_filtered_drinks(nil, 'abc')).to eq([@black_mt, @green_mt, @hongkong_mt, @oolong_mt])
      end

      it 'returns all drinks sorted by calories ascending' do
        expect(@milk_teas.sorted_and_filtered_drinks(nil, 'cal')).to eq([@green_mt, @oolong_mt, @black_mt, @hongkong_mt])
      end

      it 'returns all drinks unsorted and unfiltered' do
        expect(@milk_teas.sorted_and_filtered_drinks(nil, false)).to eq([@black_mt, @oolong_mt, @green_mt, @hongkong_mt])
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
