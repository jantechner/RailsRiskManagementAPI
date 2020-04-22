class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.references :risk, null: false, foreign_key: true
      t.text :description
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
