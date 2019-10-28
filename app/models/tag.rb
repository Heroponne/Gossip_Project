class Tag < ApplicationRecord
  has_many :subjects
  has_many :gossips, through: :subjects
end
