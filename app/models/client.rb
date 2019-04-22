class Client < ApplicationRecord
  has_many :user_clients, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
