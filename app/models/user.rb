class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :post_images, dependent: :destroy
  
  has_many :introductions, dependent: :destroy
  validates :introduction, presence: false, length: { maximum: 50 }
end
