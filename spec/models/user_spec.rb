require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end
  it "is valid with valid attributes" do
    expect(@user1).to be_valid  
  end

  it "is not valid when no password" do
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid 
  end

  it "creates profile after user created" do
    expect(@user1.profile).to_not be_nil
  end

  describe "associations" do
    it { should have_many(:jobs_published).class_name('JobsPublished')}
    it { should have_and_belong_to_many(:companies).class_name('Company')}
    it { should have_one(:profile).class_name('Profile')}
  end


end
