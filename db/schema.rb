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

ActiveRecord::Schema.define(version: 2020_06_19_214607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consorcios", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.string "propietario"
    t.string "inquilino"
    t.decimal "coeficiente"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "consorcio_id"
    t.string "identificador"
  end

  create_table "facturas", force: :cascade do |t|
    t.integer "departamento_id"
    t.decimal "importe"
    t.string "estado"
    t.date "periodo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gastos", force: :cascade do |t|
    t.date "fecha"
    t.string "descripcion"
    t.decimal "importe"
    t.integer "consorcio_id"
    t.string "tipo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "fecha_cobro"
  end

end
