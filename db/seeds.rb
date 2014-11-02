# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(user_role: 'Admin')
Role.create(user_role: 'User')

User.create(email: 'andrew.burg@iaction.com.au', password: 'password', first_name: 'Andrew', last_name: 'Burg', mobile: '0417 063 008', role_id: 1)
User.create(email: 'shirren@ureferjobs.com', password: 'password', first_name: 'Shirren', last_name: 'Premaratne', mobile: '0435 094 699', role_id: 1)

Lookup.create(name: 'Hour', value: 'hour', lookup_type: 'BusinessTime')
Lookup.create(name: 'Hours', value: 'hours', lookup_type: 'BusinessTime')
Lookup.create(name: 'Day', value: 'day', lookup_type: 'BusinessTime')
Lookup.create(name: 'Days', value: 'days', lookup_type: 'BusinessTime')

BaseSla.create(name: '8 Business Hours', period: 'Hours', quantity: '8')
BaseSla.create(name: '3 Business Days', period: 'Days', quantity: '3')