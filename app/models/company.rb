class Company < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :jobs_publisheds
end
