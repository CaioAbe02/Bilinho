class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.text :nome
      t.text :cnpj
      t.text :tipo

      t.timestamps
    end
  end
end
