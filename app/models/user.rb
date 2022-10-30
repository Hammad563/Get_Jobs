class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :database_authenticatable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :trackable

          #:database_authenticatable
  has_one :profile
  has_many :jobs_published
  after_create :after_create_user

  def after_create_user
    profile = Profile.new({
      user_id: self.id
    })
    profile.save!
  end

end
