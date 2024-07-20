class Collaboration < ApplicationRecord

  validates :title, :description, :category, :price, :start_date, :end_date, presence: true

  belongs_to :user
  has_many :submissions, dependent: :destroy

  before_save :capitalize_title

  validate :user_brand

  private

  def capitalize_title
    self.title = title.capitalize if title.present?
  end

  def user_brand
    errors.add(:user, 'must be a brand to create a collaboration') unless user.brand
  end
end
