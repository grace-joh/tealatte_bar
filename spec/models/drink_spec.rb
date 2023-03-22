require 'rails_helper'

RSpec.describe Drink, type: :model do
  describe 'relationships' do
    it { should belong_to :category }
  end

  describe 'instance methods' do
    before :each do
      @milk_teas = Category.create!(name: 'Milk Teas', price: 5, caffeinated: true)
      @smoothies = Category.create!(name: 'Smoothies', price: 7, caffeinated: false)
      @black_mt = Drink.create!(name: 'Black Milk Tea', calories: 270, has_milk: true, category_id: @milk_teas.id)
      @mango_smth = Drink.create!(name: 'Mango Smoothie', calories: 300, has_milk: true, category_id: @smoothies.id)
    end

    describe '#category' do
      it 'returns the associated category object' do
        expect(@black_mt.category).to eq(@milk_teas)
        expect(@black_mt.category.name).to eq('Milk Teas')
      end
    end
  end
end
