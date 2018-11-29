class Location < ApplicationRecord
    has_many :pet, dependent: :destroy
end
