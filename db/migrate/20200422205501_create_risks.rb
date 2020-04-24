class CreateRisks < ActiveRecord::Migration[6.0]
  def change
    create_table :risks do |t|
      t.text :description
      t.string :likelihood
      t.string :impact
      t.string :severity
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :risk_register, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
