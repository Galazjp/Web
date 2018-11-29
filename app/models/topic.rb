class Topic < ApplicationRecord
    has_many :review_topic, dependent: :destroy
    has_many :review, through: :review_topic
end
