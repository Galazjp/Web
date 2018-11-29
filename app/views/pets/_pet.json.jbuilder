json.extract! pet, :id, :names, :date_of_birth, :rating, :user_id, :location_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
