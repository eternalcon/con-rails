AdminUser.create!(email: 'boris@eternal-con.de', password: 'eternal_admin_123!', password_confirmation: 'eternal_admin_123!')
AdminUser.create!(email: 'daniel@eternal-con.de', password: 'eternal_admin_123!', password_confirmation: 'eternal_admin_123!')

Event.create(name: 'Eternal Convention 2018', start_date: Date.parse('2018-05-19'), end_date: Date.parse('2018-05-21'), active: true)