class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrator, class_name: 'User'

  validate :start_must_be_after_now

  validates :start_date,
  presence: true

  validates :duration,
  presence: true,
  numericality: { greater_than: 4 }

  validates :title,
  presence: true,
  length: { in: 1..140 }

  validates :description,
  presence: true,
  length: { in: 1..1000 }

  validates :price,
  presence: true,
  numericality: { greater_than: 0, less_than: 1001 }

  validates :location,
  presence: true

  private

  def start_must_be_after_now
    errors.add(:start_date, "must be after now") unless
        start_date > Time.now
  end

end
