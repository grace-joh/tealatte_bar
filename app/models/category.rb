class Category < ApplicationRecord
  has_many :drinks

  def self.sort_by_newest
    order(created_at: :desc)
  end
end
