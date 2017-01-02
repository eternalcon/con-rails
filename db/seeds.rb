# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'boris@eternal-con.de', password: 'eternal_admin_123!', password_confirmation: 'eternal_admin_123!')
AdminUser.create!(email: 'daniel@eternal-con.de', password: 'eternal_admin_123!', password_confirmation: 'eternal_admin_123!')

Event.create(name: 'Eternal Convention 2017', subtitle: 'Eternal Convention 2017', startdate: Date.parse('2017-06-02'), enddate: Date.parse('2017-06-05'), active: true)
