class Education < ApplicationRecord
  belongs_to :profile
  validates :major, uniqueness: { scope: [:profile_id, :major] }
end
