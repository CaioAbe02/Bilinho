class Student < ApplicationRecord
    has_many :enrollments
    validates :nome, presence: true, uniqueness: true
    validates :cpf, numericality: {only_integer: true}, uniqueness: true
    validates_date :data_nascimento, on_or_before: lambda {Date.current}, allow_blank: true
    validates :celular, numericality: {only_integer: true}, allow_blank: true
    validates :genero, inclusion: {in: %w(M F)}
    validates :meio_pagamento_bills, inclusion: {in: %w(Boleto Cartão)}
end
