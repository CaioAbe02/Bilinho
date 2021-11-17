class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.text :nome
      t.text :cpf
      t.date :data_nascimento
      t.integer :celular
      t.text :genero
      t.text :meio_pagamento_faturas

      t.timestamps
    end
  end
end
