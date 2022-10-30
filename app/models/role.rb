class Role < ApplicationRecord
  belongs_to :profile
  validates :name, uniqueness: { scope: [:profile_id, :name] }
end
