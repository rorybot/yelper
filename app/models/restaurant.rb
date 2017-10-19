class Restaurant < ApplicationRecord
  has_many :ratings

  validates :name, presence: true,
                   length: {minimum: 2}

end
