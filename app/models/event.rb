class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :state, presence: true

  validate :validate_future_date_event

  belongs_to :user
  has_many :registrations, dependent: :destroy
  has_many :joined_users, through: :registrations, source: :user
  has_many :comments, dependent: :destroy
  has_many :user_comment, through: :comments, source: :user


  def validate_future_date_event
    if date.present? && date < Date.today
      errors.add(:date, "Event date must be in future")
    end
  end

  def self.find_same_state(state)
    Event.where( "state = ?", state )
  end

  def self.find_not_same_state(state)
    Event.where.not("state = ?", state)
  end
end
