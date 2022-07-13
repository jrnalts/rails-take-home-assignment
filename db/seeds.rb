# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

USER_SEEDS = [
  {email: '123@test.com', password: '123456'},
  {email: '111@test.com', password: '123456'},
]

STOCKS_SEEDS = [
  {code: 1101, name: '台泥	', price: 41},
  {code: 1102, name: '亞泥	', price: 43},
  {code: 1103, name: '嘉泥	', price: 17},
  {code: 1104, name: '環泥	', price: 22},
  {code: 1108, name: '幸福	', price: 10},
  {code: 1109, name: '信大	', price: 19},
  {code: 1110, name: '東泥	', price: 18},
  {code: 1201, name: '味全	', price: 20},
  {code: 1203, name: '味王	', price: 33},
  {code: 1210, name: '大成	', price: 47},
  {code: 1213, name: '大飲	', price: 7.5},
  {code: 1215, name: '卜蜂	', price: 75},
  {code: 1216, name: '統一	', price: 69},
]

User.create(USER_SEEDS)
Stock.create(STOCKS_SEEDS)
