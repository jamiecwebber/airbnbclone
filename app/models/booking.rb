class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  has_many :reviews

  validates :enter_date, :exit_date, presence: true
  validate :exit_date_after_enter_date
  validate :start_date_cant_be_in_the_past

  private

  def exit_date_after_enter_date
    errors.add(:exit_date, "must be after the start date") if exit_date < enter_date
  end

  def start_date_cant_be_in_the_past
    errors.add(:enter_date, "must be from today or forward") if enter_date < (Date.today).to_s
  end
end
