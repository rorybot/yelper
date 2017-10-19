class Restaurant < ApplicationRecord
  has_many :ratings

  validates :name, presence: true,
                   length: {minimum: 2}
  validates :description, presence: true,
                   length: {minimum: 5}

end
