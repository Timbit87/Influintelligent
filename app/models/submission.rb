class Submission < ApplicationRecord
  belongs_to :collaboration
  belongs_to :user
  enum status: { pending: 0, confirmed: 1, declined: 2, cancelled: 3 }
end
