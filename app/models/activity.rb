class Activity < ActiveRecord::Base
  has_many :scores
  has_many :users, through: :scores

  validates :activity_type, presence: true, inclusion: { in: %w(Challenge Practice Game), message: "%{value} is not a valid activity type"}
end
