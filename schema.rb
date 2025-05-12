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

ActiveRecord::Schema[8.0].define(version: 2025_05_12_111255) do
  enable_extension "plpgsql"

  # Таблица студентов
  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthdate"
    t.string "email", null: false, unique: true
    t.string "phone"
    t.integer "course_year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # Таблица преподавателей
  create_table "professors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false, unique: true
    t.string "phone"
    t.text "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # Таблица дисциплин
  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "credits", null: false
    t.bigint "professor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.foreign_key :professors
  end

  # Таблица оценок
  create_table "grades", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.integer "grade", null: false
    t.date "grade_date", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.foreign_key :students
    t.foreign_key :courses
  end

  # Таблица отчетов по семестрам
  create_table "semester_reports", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.integer "semester", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.text "performance_summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.foreign_key :students
  end

end

add_foreign_key "students", "professors"
add_foreign_key "account_configs", "accounts"
add_foreign_key "courses", "professors"
add_foreign_key "grades", "students"
add_foreign_key "grades", "courses"
add_foreign_key "semester_reports", "students"

