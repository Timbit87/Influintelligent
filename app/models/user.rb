class User < ApplicationRecord
  has_many :collaborations
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :avatar

  def brand?
    self.brand
  end
end
