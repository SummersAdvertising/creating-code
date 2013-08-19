# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new
admin.email = "yuzhe@summers.com.tw"
admin.password = "11111111"
admin.password_confirmation = "11111111"
admin.encrypted_password = "$2a$10$TfsZ3nHA6LHzuleQC3PeMua.Waj2dD2qtLrvhDX1bmkV35TVBq/96"
admin.save
