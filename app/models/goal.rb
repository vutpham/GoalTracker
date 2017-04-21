class Goal < ApplicationRecord
  validates :goal_title, presence: true
  validates :user_id, presence: true
  validates :achieved, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
end
