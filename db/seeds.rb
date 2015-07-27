# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Group.destroy_all
Quote.destroy_all
g1 = Group.create(:name => "WDI-9", :avatar => "https://ga-core.s3.amazonaws.com/production/uploads/program/default_image/128/thumb_WDI.png", :instructor => "Joel Turnbull")
g2 = Group.create(:name => "WDI-10", :avatar => "https://ga-core.s3.amazonaws.com/production/uploads/program/default_image/128/thumb_WDI.png", :instructor => "Joel Turnbull")
# q1 = Quote.create(:quote => "WDI9 ~Joel", :group_id => 9)
# q2 = Quote.create(:quote => "WDI-10 ~Joel", :group_id => 10)