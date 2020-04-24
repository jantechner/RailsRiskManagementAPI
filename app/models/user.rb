class User < ApplicationRecord
  has_many :risk_registers, foreign_key: 'owner_id'
  has_many :risks, through: :risk_registers, foreign_key: 'owner_id'
  has_many :projects, through: :risk_registers
end
