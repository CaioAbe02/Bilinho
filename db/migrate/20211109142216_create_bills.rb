class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.float :valor
      t.date :data_vencimento
      t.references :enrollment, null: false, foreign_key: true
      t.text :status

      t.timestamps
    end
  end
end
