require 'rails_helper'

RSpec.describe Drink, type: :model do
  before :each do
    @teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
    @slushes = Category.create!(name: 'Slushes', price: 5, caffeinated: false)
    @black_mt = @teas.drinks.create!(name: 'Black Milk Tea', calories: 270, in_season: true)
    @mango_slush = @slushes.drinks.create!(name: 'Mango Slush', calories: 250, in_season: true)
    @passion_fruit_slush = @slushes.drinks.create!(name: 'Passion Fruit Slush', calories: 240, in_season: false)
  end

  describe 'relationships' do
    it { should belong_to :category }
  end

  describe 'instance methods' do
    describe '#category' do
      it 'returns the associated category object' do
        expect(@black_mt.category).to eq(@teas)
        expect(@black_mt.category.name).to eq('Milk Teas')
      end
    end
  end

  describe 'class methods' do
    describe '::only_in_season' do
      it 'returns drinks only in season' do
        expect(Drink.only_in_season).to eq([@black_mt, @mango_slush])
      end
    end
  end
end
