class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :review, dependent: :destroy
  has_many :pet_type, dependent: :destroy
  has_many :type, through: :pet_type
  mount_uploader :image, ImageUploader

  def set_user!(user)
    self.user_id = user.id
    self.save!
  end
end
