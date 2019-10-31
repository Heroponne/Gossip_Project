class Gossip < ApplicationRecord
  validates :title,
    presence: true,
    length: { in: 3..14 }
  validates :content,
    presence: true
  belongs_to :user
  has_many :subjects
  has_many :tags, through: :subjects
  has_many :comments, dependent: :destroy
end
