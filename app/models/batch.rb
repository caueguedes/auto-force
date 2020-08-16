class Batch < ApplicationRecord
  has_many :orders, autosave: true

  include BatchValidator
  include Filterable

  scope :filter_by_reference, -> (reference){ where(reference: reference) }
end
# https://makandracards.com/alexander-m/39365-generate-unique-random-token