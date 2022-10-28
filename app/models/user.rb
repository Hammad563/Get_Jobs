class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :database_authenticatable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :trackable

          #:database_authenticatable

end
