class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :submissions #submissions as a user
  has_many :collaborations, dependent: :destroy
  has_many :submissions_as_brand, through: :collaborations, source: :submissions
  before_save :capitalize_name

  has_one_attached :avatar

  CATEGORIES = ['Fashion', 'Beauty', 'Lifestyle', 'Travel', 'Food', 'Fitness', 'Tech', 'Art', 'Music', 'Sports', 'Toy', 'Game', 'Electronic', 'Stationary'].freeze

  def brand?
    self.brand
  end

  def instagram_handle
    return unless social_links['instagram'].present?

    social_links['instagram'].split('/').last
  end
  
  def capitalize_name
    self.first_name = first_name.capitalize if first_name.present?
    self.last_name = last_name.capitalize if last_name.present?
  end
end
