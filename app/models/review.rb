class Review < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_many :review_topic, dependent: :destroy
  has_many :topic, through: :review_topic
  def set_user!(user)
    self.user_id = user.id
    self.save!
  end
end
