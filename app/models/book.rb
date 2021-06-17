class Book < ApplicationRecord
  validates :title,presence: true
  validates :body,presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
end
