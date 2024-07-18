class Collaboration < ApplicationRecord
  belongs_to :user
  has_many :submissions

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
