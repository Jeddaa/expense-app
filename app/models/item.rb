class Item < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
