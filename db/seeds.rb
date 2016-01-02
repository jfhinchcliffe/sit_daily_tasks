# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Task.create!( title: 'Monday Only', description: 'Monday Only', monday: true, date_schedule: Time.now)
Task.create!(title: 'Tuesday Only', description: 'Tuesday Only', tuesday: true, date_schedule: Time.now)
Task.create!( title: 'Wednesday Only', description: 'Wednesday Only', wednesday: true, date_schedule: Time.now)
Task.create!( title: 'Thursday Only', description: 'Thursday Only', thursday: true, date_schedule: Time.now)
Task.create!( title: 'Friday Only', description: 'Friday Only', friday: true, date_schedule: Time.now)
Task.create!( title: 'Saturday Only', description: 'Saturday Only', saturday: true, date_schedule: Time.now)
Task.create!( title: 'Sunday Only', description: 'Sunday Only', sunday: true, date_schedule: Time.now)
Task.create!( title: 'All Days', description: 'All days', monday: true, tuesday: true, wednesday: true, thursday: true, friday: true, saturday: true, sunday: true, date_schedule: Time.now)
Task.create!( title: 'No days', description: 'No days', date_schedule: Time.now)
