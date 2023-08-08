class Category < ApplicationRecord
  belongs_to :author , class_name: 'User'
  has_many :items, through: :items_categories, dependent: :destroy
  has_many :item_categories, dependent: :destroy

  validates :name, :icon, presence: true
end
