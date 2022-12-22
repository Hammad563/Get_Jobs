class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :database_authenticatable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :trackable

          #:database_authenticatable
  has_one :profile, dependent: :destroy
  has_many :jobs_published
  has_and_belongs_to_many :companies
  after_create :after_create_user


  def after_create_user
    profile = Profile.new({
      user_id: self.id
    })
    profile.save!
    self.profile_id = profile.id
  end

end
