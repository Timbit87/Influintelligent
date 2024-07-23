class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :submissions #submissions as a user
  has_many :collaborations, dependent: :destroy
  has_many :submissions_as_brand, through: :collaborations, source: :submissions

  has_one_attached :avatar

  def brand?
    self.brand
  end
end
