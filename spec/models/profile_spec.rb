require 'rails_helper'

RSpec.describe Profile, type: :model do
  

  it "automatically created profile" do
    user = create(:user)
    expect(user.profile).to_not be_nil
  end
  describe 'assoications' do 
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:education).class_name('Education') }
    it { should have_many(:work_experience).class_name('WorkExperience')}
  end
end
