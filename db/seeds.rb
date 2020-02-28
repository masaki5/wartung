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
      email: 'zz@z',
      password: 'yyy666',
      name: '本田',
    },
    {
      email: 'z@zz',
      password: 'yyy666',
      name: '豊田',
    },
    {
      email: 'z@zzz',
      password: 'yyy666',
      name: '鈴木',
    },
    {
      email: 'z@zzzz',
      password: 'yyy666',
      name: '佐藤',
    },
    {
      email: 'z@zzzzz',
      password: 'yyy666',
      name: '田中',
    },
    {
      email: 'zz@zzzzz',
      password: 'yyy666',
      name: 'ダイハツ',
    },
    {
      email: 'zzzz@zzzzz',
      password: 'yyy666',
      name: '日産',
    },
    {
      email: 'zzzz@zzzzz',
      password: 'yyy666',
      name: 'VW',
    },
    {
      email: 'y@y',
      password: 'yyy666',
      name: 'audi',
    },
    {
      email: 'y@yy',
      password: 'yyy666',
      name: 'volvo',
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