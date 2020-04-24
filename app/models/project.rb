class Project < ApplicationRecord
  validates :name, presence: true
  has_many :risk_registers
  has_many :users, through: :risk_registers
  has_many :risks, through: :risk_registers
end
