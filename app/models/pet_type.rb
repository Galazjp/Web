class PetType < ApplicationRecord
  belongs_to :type
  belongs_to :pet
end
