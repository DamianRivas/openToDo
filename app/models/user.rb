class User < ApplicationRecord
  before_save { self.email = email.downcase if email.present? }
  
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists, dependent: :destroy
  
  validates :password, presence: true, length: { minimum: 6 }, if: -> { password_digest.nil? }
  validates :password, length: { minimum: 6 }, allow_blank: true
  
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }
            
  has_secure_password
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
