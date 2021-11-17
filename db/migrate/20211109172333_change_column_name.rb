class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :meio_pagamento_faturas, :meio_pagamento_bills
  end
end
