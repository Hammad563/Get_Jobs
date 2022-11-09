require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
  describe "associations" do
    it { should belong_to(:profile).class_name('Profile') } 
  end
end
