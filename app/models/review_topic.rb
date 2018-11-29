class ReviewTopic < ApplicationRecord
  belongs_to :review
  belongs_to :topic
end
