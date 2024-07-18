class Submission < ApplicationRecord
  belongs_to :collaboration
  belongs_to :user
end
