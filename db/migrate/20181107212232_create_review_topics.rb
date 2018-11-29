class CreateReviewTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :review_topics do |t|
      t.references :review, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
