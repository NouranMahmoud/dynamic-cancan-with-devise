# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: 'Admin')
Role.create(name: 'Broker')
Role.create(name: 'Visitor')

Permission.create(action: 'manage', subject_class:'all',name:'FullAdmin')
adminRole=Role.find_by_name('Admin')
adminRole.permissions << Permission.first
adminRole.save()
User.create(email: "admin@admin.com", password: "12345678", password_confirmation: "12345678", role_id: adminRole.id )
visitorRole=Role.find_by_name('Visitor')
User.create(email: "guest@guest.com", password: "12345678", password_confirmation: "12345678", role_id: visitorRole.id)
