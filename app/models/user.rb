class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates :state, presence: true
  validates :email, presence: true,
            format: /\A\S+@\S+\z/,
            uniqueness: {case_sensitive: false}

  has_many :events, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :joined_events, through: :registrations, source: :event
  has_many :comments, dependent: :destroy
  has_many :event_comment, through: :comments, source: :event

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
