class Institution < ApplicationRecord
    has_many :enrollments
    validates :nome, presence: true, uniqueness: true
    validates :cnpj, numericality: {only_integer: true}, uniqueness: true
    validates :tipo, inclusion: {in: %w(Universidade Escola Creche)}
end
