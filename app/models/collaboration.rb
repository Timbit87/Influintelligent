class Collaboration < ApplicationRecord
  belongs_to :brand
  validates :title, :description, :price, :start_date, :closing_date, presence: true
end
