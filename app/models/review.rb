class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, :content, presence: true, allow_blank: false
end
