class Drink < ApplicationRecord
  belongs_to :category

  def self.only_in_season
    where(in_season: true)
  end
end
