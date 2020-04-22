class CreateRiskRegisters < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_registers do |t|
      t.references :project, null: false, foreign_key: true
      t.string :category
      t.references :owner, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
