class Book < ApplicationRecord
  validates :title,presence: true
  validates :body,presence: true
  # attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  validates :body, presence: false, length: { maximum: 200 }
end
