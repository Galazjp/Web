class User < ApplicationRecord
  has_many :pet, dependent: :destroy
  has_many :review, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_one :phrase, dependent: :destroy
  mount_uploader :profile_picture, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
