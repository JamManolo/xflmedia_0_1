#!/bin/csh -f

set echo

rails g migration add_even_more_to_scoring_format \
  fum_lost_pts:integer \
  d_safety_pts:integer \
  d_shutout_pts:integer \
  d_3_pts_or_less_pts:integer \
  d_6_pts_or_less_pts:integer \
  d_7_pts_or_less_pts:integer \
  d_9_pts_or_less_pts:integer \
  d_42_pts_or_more_pts:integer \
  d_50_pts_or_more_pts:integer \
  d_200_yds_or_less_pts:integer \
  d_450_yds_or_more_pts:integer \
  d_500_yds_or_more_pts:integer \
  d_fr_pts:integer \
  d_int_pts:integer \
  d_sack_pts:integer \
  d_block_kick_pts:integer \
  idp_tackle_pts:integer \
  idp_assist_pts:integer \
  idp_ff_pts:integer \
  idp_fr_pts:integer \
  idp_int_pts:integer \
  idp_sack_pts:integer \
  idp_safety_pts:integer \
  idp_block_kick_pts:integer \
  

