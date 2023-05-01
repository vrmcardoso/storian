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

ActiveRecord::Schema[7.0].define(version: 2023_04_22_163437) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "book_characters", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_characters_on_book_id"
    t.index ["character_id"], name: "index_book_characters_on_character_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pen_name_id", null: false
    t.text "description"
    t.bigint "world_id"
    t.bigint "series_id"
    t.index ["pen_name_id"], name: "index_books_on_pen_name_id"
    t.index ["series_id"], name: "index_books_on_series_id"
    t.index ["world_id"], name: "index_books_on_world_id"
  end

  create_table "character_languages", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_languages_on_character_id"
    t.index ["language_id"], name: "index_character_languages_on_language_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "physical_description"
    t.text "personality_description"
    t.text "traits_and_quirks"
    t.text "backstory"
    t.bigint "place_of_birth_id"
    t.bigint "nationality_id"
    t.bigint "race_id"
    t.bigint "religion_id"
    t.index ["nationality_id"], name: "index_characters_on_nationality_id"
    t.index ["place_of_birth_id"], name: "index_characters_on_place_of_birth_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["religion_id"], name: "index_characters_on_religion_id"
    t.index ["world_id"], name: "index_characters_on_world_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.date "date"
    t.bigint "historical_timeline_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["historical_timeline_id"], name: "index_events_on_historical_timeline_id"
  end

  create_table "historical_timelines", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_historical_timelines_on_world_id"
  end

  create_table "language_nations", force: :cascade do |t|
    t.bigint "language_id", null: false
    t.bigint "nation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_language_nations_on_language_id"
    t.index ["nation_id"], name: "index_language_nations_on_nation_id"
  end

  create_table "language_races", force: :cascade do |t|
    t.bigint "language_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_language_races_on_language_id"
    t.index ["race_id"], name: "index_language_races_on_race_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_languages_on_world_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_locations_on_world_id"
  end

  create_table "magic_systems", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_magic_systems_on_world_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_maps_on_world_id"
  end

  create_table "nation_races", force: :cascade do |t|
    t.bigint "nation_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nation_id"], name: "index_nation_races_on_nation_id"
    t.index ["race_id"], name: "index_nation_races_on_race_id"
  end

  create_table "nations", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_nations_on_world_id"
  end

  create_table "pen_names", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pen_names_on_user_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_races_on_world_id"
  end

  create_table "religion_nations", force: :cascade do |t|
    t.bigint "religion_id", null: false
    t.bigint "nation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nation_id"], name: "index_religion_nations_on_nation_id"
    t.index ["religion_id"], name: "index_religion_nations_on_religion_id"
  end

  create_table "religion_races", force: :cascade do |t|
    t.bigint "religion_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_religion_races_on_race_id"
    t.index ["religion_id"], name: "index_religion_races_on_religion_id"
  end

  create_table "religions", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_religions_on_world_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_series_on_world_id"
  end

  create_table "tradition_nations", force: :cascade do |t|
    t.bigint "tradition_id", null: false
    t.bigint "nation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nation_id"], name: "index_tradition_nations_on_nation_id"
    t.index ["tradition_id"], name: "index_tradition_nations_on_tradition_id"
  end

  create_table "tradition_races", force: :cascade do |t|
    t.bigint "tradition_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_tradition_races_on_race_id"
    t.index ["tradition_id"], name: "index_tradition_races_on_tradition_id"
  end

  create_table "traditions", force: :cascade do |t|
    t.string "name"
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_id"], name: "index_traditions_on_world_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "worlds", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["user_id"], name: "index_worlds_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_characters", "books"
  add_foreign_key "book_characters", "characters"
  add_foreign_key "books", "pen_names"
  add_foreign_key "books", "series"
  add_foreign_key "books", "worlds"
  add_foreign_key "character_languages", "characters"
  add_foreign_key "character_languages", "languages"
  add_foreign_key "characters", "locations", column: "place_of_birth_id"
  add_foreign_key "characters", "nations", column: "nationality_id"
  add_foreign_key "characters", "races"
  add_foreign_key "characters", "religions"
  add_foreign_key "characters", "worlds"
  add_foreign_key "events", "historical_timelines"
  add_foreign_key "historical_timelines", "worlds"
  add_foreign_key "language_nations", "languages"
  add_foreign_key "language_nations", "nations"
  add_foreign_key "language_races", "languages"
  add_foreign_key "language_races", "races"
  add_foreign_key "languages", "worlds"
  add_foreign_key "locations", "worlds"
  add_foreign_key "magic_systems", "worlds"
  add_foreign_key "maps", "worlds"
  add_foreign_key "nation_races", "nations"
  add_foreign_key "nation_races", "races"
  add_foreign_key "nations", "worlds"
  add_foreign_key "pen_names", "users"
  add_foreign_key "races", "worlds"
  add_foreign_key "religion_nations", "nations"
  add_foreign_key "religion_nations", "religions"
  add_foreign_key "religion_races", "races"
  add_foreign_key "religion_races", "religions"
  add_foreign_key "religions", "worlds"
  add_foreign_key "series", "worlds"
  add_foreign_key "tradition_nations", "nations"
  add_foreign_key "tradition_nations", "traditions"
  add_foreign_key "tradition_races", "races"
  add_foreign_key "tradition_races", "traditions"
  add_foreign_key "traditions", "worlds"
  add_foreign_key "worlds", "users"
end
