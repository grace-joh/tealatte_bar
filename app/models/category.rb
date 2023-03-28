class Category < ApplicationRecord
  has_many :drinks, :dependent => :destroy

  def self.sort_by(params)
    if params[:sort] == 'count'
      left_joins(:drinks).group('categories.id').order('drinks.count DESC').to_a
    else
      all.order(created_at: :desc)
    end
  end

  def sorted_and_filtered_drinks(cal_max, sort)
    drinks = self.drinks
    drinks = drinks.order(:name) if sort == 'abc'
    drinks = drinks.order(:calories) if sort == 'cal'
    drinks = drinks.where('calories <= ?', cal_max.to_i) if cal_max.present?
    drinks
  end
end
