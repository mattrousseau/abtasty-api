class UserClient < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :client, uniqueness: { scope: :user }
end
