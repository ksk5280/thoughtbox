class User < ActiveRecord::Base
  has_secure_password
  has_many :links
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :password_confirmation
end
