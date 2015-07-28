class User < ActiveRecord::Base
  include BCrypt

  has_many :scores
  has_many :activities, through: :scores
  scope :players, -> { where(admin: false) }

  validates :firstname, presence: true
  def total_score
    scores.sum(:value)
  end

  def player_stat(challenge)
    score = scores.find( challenge.id)
    score.value
  end

  def is_coach?
    !!current_user.admin
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    end
  end
end
