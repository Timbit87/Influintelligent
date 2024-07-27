class Collaboration < ApplicationRecord
  CATEGORIES = ['Fashion', 'Beauty', 'Lifestyle', 'Travel', 'Food', 'Fitness', 'Tech', 'Art', 'Music', 'Sports', 'Toy', 'Game', 'Electronic', 'Stationary'].freeze

  validates :title, :description, :category, :price, :start_date, :end_date, presence: true
  validates :category, inclusion: { in: CATEGORIES }, allow_nil: false
  belongs_to :user
  has_many :submissions, dependent: :destroy
  before_validation :capitalize_title, :capitalize_categories
  validate :user_brand

  has_one_attached :banner

  private

  def capitalize_title
    self.title = title.capitalize if title.present?
  end

  def capitalize_categories
    self.category = category.map(&:capitalize) if category.present?
  end

  def user_brand
    errors.add(:user, 'must be a brand to create a collaboration') unless user.brand
  end
end
