class Type < ApplicationRecord
    has_many :pet_type, dependent: :destroy
    has_many :pet, through: :pet_type
end
