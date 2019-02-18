class Tweet < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  has_many :comments
end
