class CreateEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
      t.float :valor_curso
      t.integer :qtd_bills
      t.integer :dia_vencimento_bill
      t.text :nome_curso
      t.references :institution, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
