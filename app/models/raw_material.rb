class RawMaterial < ApplicationRecord
  CATEGORIES = [
    'Base Oils',
    'Essential Oils',
    'Lye',
    'Liquids',
    'Colorants',
    'Additives',
  ]

  validates :name, presence: true, uniqueness: true
  validates_inclusion_of :category, in: CATEGORIES
end
