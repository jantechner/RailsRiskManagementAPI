class User < ApplicationRecord
  has_many :projects, through: :risk_register
end
