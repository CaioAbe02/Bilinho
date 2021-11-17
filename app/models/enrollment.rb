class Enrollment < ApplicationRecord
  after_create :create_bills

  belongs_to :institution
  belongs_to :student
  has_many :bills
  validates :valor_curso, numericality: {greater_than: 0}
  validates :qtd_bills, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :dia_vencimento_bill, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 31}
  validates :nome_curso, presence: true
  validates :institution_id, presence: true
  validates :student_id, presence: true

  private
  def create_bills
    CreateEnrollmentBills.perform(self)
  end
end