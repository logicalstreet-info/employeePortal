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

ActiveRecord::Schema[7.0].define(version: 2022_07_06_054726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "bonds", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_bonds_on_organization_id"
    t.index ["user_id"], name: "index_bonds_on_user_id"
  end

  create_table "feature_flags", force: :cascade do |t|
    t.string "employee_bond", default: "off", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_feature_flags_on_organization_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.boolean "is_private", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_groups_on_organization_id"
  end

  create_table "leave_applications", force: :cascade do |t|
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "from_time"
    t.datetime "to_time"
    t.integer "leave_type"
    t.integer "status"
    t.boolean "half_day", default: false
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "apporved_by"
    t.index ["organization_id"], name: "index_leave_applications_on_organization_id"
    t.index ["user_id"], name: "index_leave_applications_on_user_id"
  end

  create_table "leave_balances", force: :cascade do |t|
    t.datetime "leave_date"
    t.bigint "user_id", null: false
    t.bigint "leave_application_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leave_application_id"], name: "index_leave_balances_on_leave_application_id"
    t.index ["organization_id"], name: "index_leave_balances_on_organization_id"
    t.index ["user_id"], name: "index_leave_balances_on_user_id"
  end

  create_table "leave_days", force: :cascade do |t|
    t.datetime "holiday"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["organization_id"], name: "index_leave_days_on_organization_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_notifications_on_organization_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "weekly_off", array: true
    t.index ["deleted_at"], name: "index_organizations_on_deleted_at"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_participants_on_group_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "periods", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_periods_on_project_id"
    t.index ["user_id"], name: "index_periods_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.datetime "project_end_date"
    t.index ["organization_id"], name: "index_projects_on_organization_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.date "purchase_date"
    t.integer "warranty_month"
    t.integer "assets_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_properties_on_organization_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggables", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_taggables_on_skill_id"
    t.index ["user_id"], name: "index_taggables_on_user_id"
  end

  create_table "updates", force: :cascade do |t|
    t.datetime "in_time"
    t.datetime "out_time"
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.integer "total_hours"
    t.index ["organization_id"], name: "index_updates_on_organization_id"
    t.index ["project_id"], name: "index_updates_on_project_id"
    t.index ["user_id"], name: "index_updates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_confirmation"
    t.string "name"
    t.date "joining_date"
    t.date "birth_date"
    t.boolean "gender"
    t.string "qualification"
    t.string "mobile_number"
    t.text "address"
    t.text "native_address"
    t.string "parent_name"
    t.string "parent_mobile_number"
    t.integer "user_type"
    t.bigint "organization_id"
    t.float "lefted_leave", default: 0.0
    t.integer "employee_positions"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bonds", "organizations"
  add_foreign_key "bonds", "users"
  add_foreign_key "feature_flags", "organizations"
  add_foreign_key "groups", "organizations"
  add_foreign_key "leave_applications", "organizations"
  add_foreign_key "leave_applications", "users"
  add_foreign_key "leave_balances", "leave_applications"
  add_foreign_key "leave_balances", "organizations"
  add_foreign_key "leave_balances", "users"
  add_foreign_key "leave_days", "organizations"
  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "organizations"
  add_foreign_key "notifications", "users"
  add_foreign_key "participants", "groups"
  add_foreign_key "participants", "users"
  add_foreign_key "periods", "projects"
  add_foreign_key "periods", "users"
  add_foreign_key "projects", "organizations"
  add_foreign_key "properties", "organizations"
  add_foreign_key "properties", "users"
  add_foreign_key "taggables", "skills"
  add_foreign_key "taggables", "users"
  add_foreign_key "updates", "organizations"
  add_foreign_key "updates", "projects"
  add_foreign_key "updates", "users"
  add_foreign_key "users", "organizations"
end
