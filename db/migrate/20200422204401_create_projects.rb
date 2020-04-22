class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :goal
      t.date :start, null: false
      t.date :deadline, null: false
      t.boolean :public

      t.timestamps
    end
    add_index :projects, :name, unique: true
  end
end
