class Category < ApplicationRecord
  has_many :drinks, :dependent => :destroy

  def self.sort_by_newest
    order(created_at: :desc)
  end

  def sorted_and_filtered_drinks(cal_max, sort)
    drinks = self.drinks
    drinks = drinks.order(:name) if sort == 'abc'
    drinks = drinks.order(:calories) if sort == 'cal'
    drinks = drinks.where('calories <= ?', cal_max.to_i) if cal_max.present?
    drinks
  end
end
