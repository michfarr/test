class Product < ActiveRecord::Base
  validates :name, :description, presence: true

  def bargain?
    price < 10
  end
end
