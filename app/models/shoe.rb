class Shoe < ActiveRecord::Base
  belongs_to :user
  has_many :buyers, dependent: :destroy
  has_many :sellers, dependent: :destroy
  has_many :user_sellers, through: :sellers, source: :user
  has_many :user_buyers, through: :buyers, source: :user

  validates :name, :price, presence: true
end
