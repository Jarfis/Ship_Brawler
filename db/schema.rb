# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150918181629) do

  create_table "abilities", force: :cascade do |t|
    t.string  "name_value"
    t.string  "name_print"
    t.integer "damage"
    t.boolean "self_target"
    t.integer "turn_length"
    t.integer "energy_cost"
  end

  create_table "ship_abilities", force: :cascade do |t|
    t.integer "ship_id"
    t.integer "ability_id"
  end

  create_table "ship_weapons", force: :cascade do |t|
    t.integer "ship_id"
    t.integer "weapon_id"
  end

  create_table "ships", force: :cascade do |t|
    t.integer "max_health"
    t.integer "current_health"
    t.string  "ship_name_value"
    t.string  "ship_name"
    t.integer "max_energy"
    t.integer "energy_recharge"
    t.integer "start_energy"
    t.integer "current_energy"
  end

  create_table "weapons", force: :cascade do |t|
    t.string  "name_value"
    t.string  "name_print"
    t.integer "damage"
    t.integer "ammo"
  end

end
