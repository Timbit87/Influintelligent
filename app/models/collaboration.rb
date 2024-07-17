class Collaboration < ApplicationRecord
  belongs_to :user
  before_save :capitalize_title

  private

  def capitalize_title
    self.title = title.capitalize if title.present?
  end
end
