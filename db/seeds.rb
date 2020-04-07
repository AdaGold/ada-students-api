# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create(
  fullName: "Ada Lovelace", email: "Ada@lovelace.dev", is_present: true
)
Student.create(
  fullName: "Grace Hopper", email: "AdmrHopper@navy.mil", is_present: true
)

Student.create(
  fullName: "Christine", email: "Christine@adadev.org", is_present: false
)

