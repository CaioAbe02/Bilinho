class Bill < ApplicationRecord
  belongs_to :enrollment
  validates :valor, numericality: true
  validates_date :data_vencimento, presence: true
  validates :enrollment_id, presence: true
  validates :status, inclusion: {in: %w(Aberta Atrasada Paga)}
end
