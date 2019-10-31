class User < ApplicationRecord
  validates :first_name,
    presence: true
  validates :last_name,
    presence: true
  belongs_to :city, optional: true
  has_many :gossips, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage", dependent: :destroy
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage", dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  validates :password,
    length: { minimum: 6 }
end
