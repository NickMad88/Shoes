class User < ActiveRecord::Base
  has_secure_password
  has_many :shoes
  has_many :sellers, dependent: :destroy
  has_many :buyers, dependent: :destroy
  has_many :shoes_sold, through: :sellers, source: :shoes
  has_many :shoes_bought, through: :buyers, source: :shoes

  EMAIL_REGEX = /\A[A-Za-z0-9\.]+@[A-Za-z]+\.[A-Za-z]{3}/
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_save :downcase_email

  def downcase_email
      self.email.downcase!
  end
end
