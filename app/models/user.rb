class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
