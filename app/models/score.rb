class Score < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
end
