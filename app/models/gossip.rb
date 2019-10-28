class Gossip < ApplicationRecord
  belongs_to :user
  has_many :subjects
  has_many :tags, through: :subjects
end
