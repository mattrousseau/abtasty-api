class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_token_authenticatable

  has_many :user_clients, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@abtasty\.com\z/,
                    message: "must be a abtasty.com account" }
end
