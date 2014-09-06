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

ActiveRecord::Schema.define(version: 20140904231434) do

  create_table "names", force: true do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "MiddleName"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Gender"
  end

  create_table "precincts", force: true do |t|
    t.integer  "PrecinctUID"
    t.string   "PrecinctName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", force: true do |t|
    t.integer  "StSegUID"
    t.integer  "StartHouseNumber"
    t.integer  "EndHouseNumber"
    t.string   "OddEvenBoth"
    t.string   "StreetDirection"
    t.string   "StreetName"
    t.string   "StreetSuffix"
    t.integer  "PrecinctUID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", force: true do |t|
    t.string   "FirstName"
    t.string   "MiddleName"
    t.string   "LastName"
    t.integer  "PrecinctUID"
    t.string   "PrecinctName"
    t.integer  "HouseNumber"
    t.string   "StreetName"
    t.string   "StreetSuffix"
    t.string   "StreetDirection"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Gender"
    t.string   "DOB"
    t.string   "State"
    t.string   "LocalityName"
    t.integer  "ZIP"
    t.integer  "IdentificationNumber"
    t.string   "Country"
    t.string   "Phone"
    t.integer  "LocalityCode"
    t.string   "Email"
    t.integer  "Over18"
    t.string   "Language"
    t.string   "City"
  end

end
