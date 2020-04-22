# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_22_205622) do

  create_table "actions", force: :cascade do |t|
    t.integer "risk_id", null: false
    t.text "description"
    t.string "type"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["risk_id"], name: "index_actions_on_risk_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.text "goal"
    t.date "start", null: false
    t.date "deadline", null: false
    t.boolean "public"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_projects_on_name", unique: true
  end

  create_table "risk_registers", force: :cascade do |t|
    t.integer "project_id", null: false
    t.string "category"
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_risk_registers_on_owner_id"
    t.index ["project_id"], name: "index_risk_registers_on_project_id"
  end

  create_table "risks", force: :cascade do |t|
    t.text "description"
    t.string "likelihood"
    t.string "impact"
    t.string "severity"
    t.integer "owner_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_risks_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "actions", "risks"
  add_foreign_key "risk_registers", "projects"
  add_foreign_key "risk_registers", "users", column: "owner_id"
  add_foreign_key "risks", "owners"
end
