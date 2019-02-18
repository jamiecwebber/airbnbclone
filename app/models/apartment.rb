class Apartment < ApplicationRecord
  belongs_to :user

  validates uniqueness: true;
end
