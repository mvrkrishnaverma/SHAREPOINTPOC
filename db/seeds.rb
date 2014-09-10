# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'George', email: 'george@yopmail.com', password: 'test123', password_confirmation: 'test123')
User.create(username: 'Admin', email: 'admin@yopmail.com', password: 'test123', password_confirmation: 'test123')
User.create(username: 'Guest', email: 'guest@yopmail.com', password: 'test123', password_confirmation: 'test123')
User.create(username: 'Test', email: 'test@yopmail.com', password: 'test123', password_confirmation: 'test123')

