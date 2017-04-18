class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :state, presence: true

  validate :validate_future_date_event


  def validate_future_date_event
    if date.present? && date < Date.today
      errors.add(:date, "Event date must be in future")
    end
  end
end
