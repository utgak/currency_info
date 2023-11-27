# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_27_194751) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "char_code", null: false
    t.string "cbr_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cbr_id"], name: "index_currencies_on_cbr_id"
    t.index ["char_code"], name: "index_currencies_on_char_code"
  end

  create_table "currency_histories", force: :cascade do |t|
    t.decimal "rate", null: false
    t.date "date", null: false
    t.bigint "currency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_currency_histories_on_currency_id"
    t.index ["date"], name: "index_currency_histories_on_date"
  end

  add_foreign_key "currency_histories", "currencies"
end
