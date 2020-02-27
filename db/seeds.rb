# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
      email: 'z@z',
      password: 'yyy666',
      name: '本田',
    },
    {
      email: 'z@zz',
      password: 'yyy666',
      name: '豊田',
    }
  ]
)

# [
#   ['test1@test.com', '111111', 'テスト太郎'],
#   ['test2@test.com', '222222', 'テスト徹子']
# ].each do |mail, pass, name|
#   User.create!(
#     { email: mail, password: pass, name: name }
#   )