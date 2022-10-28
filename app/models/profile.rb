class Profile < ApplicationRecord
  belongs_to :user
  has_many :role
  has_many :education
  has_many :work_experience
end
