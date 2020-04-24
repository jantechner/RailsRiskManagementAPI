class Project < ApplicationRecord
  validates :name, presence: true

  has_many :risk_registers
end
