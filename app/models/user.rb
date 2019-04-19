class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@abtasty\.com\z/,
                    message: "must be a abtasty.com account" }
end
