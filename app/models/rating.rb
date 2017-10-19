class Rating < ApplicationRecord
  belongs_to :restaurant

  validates :rater, presence: true,
                   length: {minimum: 2}
 validates :comment, presence: true,
                  length: {minimum: 2}
  validates :score, presence: true


end
