class Category < ApplicationRecord
  has_many :drinks, :dependent => :destroy

  def self.sort_by_newest
    order(created_at: :desc)
  end
end
