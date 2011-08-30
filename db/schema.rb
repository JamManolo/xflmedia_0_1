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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110826014728) do

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "affiliation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "league_type"
    t.integer  "size"
    t.string   "comp_type"
    t.integer  "divcount"
    t.string   "sched_format"
    t.integer  "lineup_format_id"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "group_id"
    t.string   "email"
    t.boolean  "is_open"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["group_id", "email"], :name => "index_invitations_on_group_id_and_email", :unique => true

  create_table "league_formats", :force => true do |t|
    t.integer  "group_id"
    t.string   "league_type"
    t.integer  "team_count"
    t.string   "comp_type"
    t.integer  "divisions"
    t.string   "sched_format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineup_formats", :force => true do |t|
    t.integer  "qb"
    t.integer  "rb"
    t.integer  "wr"
    t.integer  "te"
    t.integer  "k"
    t.integer  "dst"
    t.integer  "idp"
    t.integer  "flex"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "group_id"
    t.integer  "ir"
    t.integer  "bench"
  end

  create_table "managers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managers", ["group_id"], :name => "index_managers_on_group_id"
  add_index "managers", ["user_id", "group_id"], :name => "index_managers_on_user_id_and_group_id", :unique => true
  add_index "managers", ["user_id"], :name => "index_managers_on_user_id"

  create_table "memberships", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.integer  "league_id"
  end

  add_index "memberships", ["league_id", "member_id"], :name => "index_memberships_on_league_id_and_member_id", :unique => true
  add_index "memberships", ["league_id"], :name => "index_memberships_on_league_id"
  add_index "memberships", ["member_id"], :name => "index_memberships_on_member_id"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "microposts", ["created_at"], :name => "index_microposts_on_created_at"
  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "owners", :force => true do |t|
    t.integer  "user_id"
    t.integer  "roster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "owners", ["roster_id"], :name => "index_owners_on_roster_id"
  add_index "owners", ["roster_id"], :name => "index_owners_on_roster_id_and_group_id", :unique => true
  add_index "owners", ["user_id", "roster_id"], :name => "index_owners_on_user_id_and_roster_id", :unique => true
  add_index "owners", ["user_id"], :name => "index_owners_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "rosters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.integer  "group_id"
    t.integer  "user_id"
  end

  create_table "scoring_formats", :force => true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.integer  "pass_yds_min"
    t.integer  "pass_yds_min_pts"
    t.integer  "pass_yds_incr"
    t.integer  "pass_yds_incr_pts"
    t.integer  "pass_yds_bonus_min"
    t.integer  "pass_yds_bonus_min_pts"
    t.integer  "pass_tds_pts"
    t.integer  "pass_tds_bonus_min_pts"
    t.integer  "pass_int_pts"
    t.integer  "pass_int_pick_6_pts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pass_tds_bonus_min"
    t.integer  "rush_yds_min"
    t.integer  "rush_yds_min_pts"
    t.integer  "rush_yds_incr"
    t.integer  "rush_yds_incr_pts"
    t.integer  "rush_yds_bonus_min"
    t.integer  "rush_yds_bonus_min_pts"
    t.integer  "rush_tds_pts"
    t.integer  "rush_tds_bonus_min"
    t.integer  "rush_tds_bonus_min_pts"
    t.integer  "rec_rec_pts"
    t.integer  "rec_yds_min"
    t.integer  "rec_yds_min_pts"
    t.integer  "rec_yds_incr"
    t.integer  "rec_yds_incr_pts"
    t.integer  "rec_yds_bonus_min"
    t.integer  "rec_yds_bonus_min_pts"
    t.integer  "rec_tds_pts"
    t.integer  "rec_tds_bonus_min"
    t.integer  "rec_tds_bonus_min_pts"
    t.integer  "misc_tds_pts"
    t.integer  "misc_tds_bonus_min"
    t.integer  "misc_tds_bonus_min_pts"
    t.integer  "two_pt_conv_pass_pts"
    t.integer  "two_pt_conv_rush_pts"
    t.integer  "two_pt_conv_rec_pts"
    t.integer  "pat_pts"
    t.integer  "pat_missed_pts"
    t.integer  "fg_0039_pts"
    t.integer  "fg_4049_pts"
    t.integer  "fg_5099_pts"
    t.integer  "fg_missed_pts"
    t.integer  "fum_lost_pts"
    t.integer  "d_safety_pts"
    t.integer  "d_shutout_pts"
    t.integer  "d_pts_allowed_level_1_pts"
    t.integer  "d_pts_allowed_level_2_pts"
    t.integer  "d_7_pts_or_less_pts"
    t.integer  "d_pts_allowed_level_3_pts"
    t.integer  "d_pts_allowed_level_8_pts"
    t.integer  "d_pts_allowed_level_9_pts"
    t.integer  "d_yds_allowed_level_1_pts"
    t.integer  "d_yds_allowed_level_8_pts"
    t.integer  "d_yds_allowed_level_9_pts"
    t.integer  "d_fr_pts"
    t.integer  "d_int_pts"
    t.integer  "d_sack_pts"
    t.integer  "d_block_kick_pts"
    t.integer  "idp_tackle_pts"
    t.integer  "idp_assist_pts"
    t.integer  "idp_ff_pts"
    t.integer  "idp_fr_pts"
    t.integer  "idp_int_pts"
    t.integer  "idp_sack_pts"
    t.integer  "idp_safety_pts"
    t.integer  "idp_block_kick_pts"
    t.integer  "d_pts_allowed_level_1"
    t.integer  "d_pts_allowed_level_2"
    t.integer  "d_pts_allowed_level_3"
    t.integer  "d_pts_allowed_level_8"
    t.integer  "d_pts_allowed_level_9"
    t.integer  "d_yds_allowed_level_1"
    t.integer  "d_yds_allowed_level_2"
    t.integer  "d_yds_allowed_level_2_pts"
    t.integer  "d_yds_allowed_level_8"
    t.integer  "d_yds_allowed_level_9"
    t.integer  "d_pts_allowed_level_7"
    t.integer  "d_pts_allowed_level_7_pts"
    t.integer  "d_yds_allowed_level_3"
    t.integer  "d_yds_allowed_level_3_pts"
    t.integer  "d_yds_allowed_level_7"
    t.integer  "d_yds_allowed_level_7_pts"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.string   "confirmation_code"
    t.boolean  "confirmed",          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
